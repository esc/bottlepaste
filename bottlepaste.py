#!/usr/bin/env python
# encoding: utf-8

# bottlepaste -- a command line pastebin
# © 2012 Valentin Haenel
# bottlepaste is licensed under the terms of the MIT License.

import abc
import hashlib
import json
import os
import re
import time
import zlib

from bottle import route, run, request, response, abort
from bson.binary import Binary
from pymongo import Connection

# the name of the collection in the MongoDB
COLLECTION = 'paste_collection'
# reserved files
RESERVED = ['index.html',
            'index.htm',
            'status.html',
            'robots.txt',
            'paste.html',
            'favicon.ico',
            ]
# regex for matching uid
UID_LEGAL = re.compile('^[a-zA-Z0-9_\-\.]{3,23}$')


def get_host():
    """ 'Host' from the HTTP header. """
    return request.headers.get('host')


def get_url(host=None):
    """ URL this app is running as, determined from HTTP header 'Host'. """
    return "http://%s" % (host if host is not None else get_host())


def read_file(filename):
    """ Read a file and return it's contents. """
    with open(filename) as file_fp:
        return file_fp.read()


def parse_cred_str(cred_str):
    """ Parse JSON based credential sting. """
    try:
        # try to convert from json to dict
        return json.loads(cred_str)
    except ValueError:
        return {}


def description(url, filename='index.tpl'):
    """ Parse and template the index file. """
    return read_file(filename).replace("DEPLOYMENT_URL", url)


def get_creds():
    """ Try to obtain the credentials dictionary form file. """
    try:
        cred_str = read_file(os.environ.get('CRED_FILE', ''))
    except IOError:
        return {}
    else:
        return parse_cred_str(cred_str)


def uid_legal(uid):
    """ Check that a uid is legal. """
    return uid not in RESERVED and \
            UID_LEGAL.match(uid) is not None


def create_db(creds):
    """ Create the database.

    If credentials for a MongoDB are found, connect to that, otherwise create a
    fallback dictionary pseudo db.

    """
    try:
        # try to init mongodb connection
        mongodburi = creds['MONGOLAB']['MONGOLAB_URI']
        return MongoDB(mongodburi)
    # fallback to simple storage if not possible
    except (KeyError):
        return DictDB()


class Database(object):
    """ Database abstract class. """

    __metaclass__ = abc.ABCMeta

    def __str__(self):
        return self._description

    @staticmethod
    def hash_(str_):
        return hashlib.sha224(str_).hexdigest()[:7]

    @staticmethod
    def make_ds(digest, code):
        return {"_id":  digest,
                "code": code,
                "date": time.time()}

    @abc.abstractmethod
    def put(self, code, uid=None):
        pass

    @abc.abstractmethod
    def get(self, uid):
        pass


class MongoDB(Database):
    """ MongoDB abstraction. """

    def __init__(self, mongodburi):
        self._description = 'mongo'
        db_name = mongodburi[mongodburi.rfind('/') + 1:]
        self._mongo = Connection(mongodburi)[db_name][COLLECTION]

    def __contains__(self, uid):
        return self._mongo.find_one(uid) is not None

    def get(self, uid):
        entry = self._mongo.find_one(uid)
        return zlib.decompress(entry['code']) if entry is not None else None

    def put(self, code, uid=None):
        if uid is None:
            uid = Database.hash_(code)
        if uid not in self:
            self._mongo.insert(Database.make_ds(uid,
                Binary(zlib.compress(code))),
                    safe=True)
        return uid


class DictDB(Database, dict):
    """ Dictionary abstraction. """

    def __init__(self):
        self._description = 'dict'

    def get(self, uid):
        try:
            return zlib.decompress(self[uid]['code'])
        except KeyError:
            return None

    def put(self, code, uid=None):
        if uid is None:
            uid = Database.hash_(code)
        if uid not in self:
            ds = Database.make_ds(uid, zlib.compress(code))
            self[uid] = ds
        return uid


@route('/')
@route('/index.htm')
@route('/index.html')
def index():
    """ Show the index.html equivalent. """
    url = get_url()
    return DESCRIPTIONS.setdefault(url, description(url))


@route('/<uid>')
def show(uid):
    """ Search for and show a given post. """
    response.content_type = 'text/plain; charset=utf-8'
    code = STORAGE.get(uid)
    if code is None:
        abort(404, "Sorry, paste: '%s' Not found." % uid)
    else:
        return code


@route('/', method='POST')
def upload():
    """ Upload a post. """
    code = request.forms.get("bp")
    uid = request.forms.get("uid")
    # user has requested a uri
    if uid is not None:
        # uid exits already
        if uid in STORAGE:
            # it's not the same as the existing one
            if STORAGE.get(uid) != code:
                response.status = 410
                return "Sorry, your requested uid: '%s' is already taken" % uid
        # check the legality
        elif not uid_legal(uid):
            response.status = 406
            return "Sorry, your requested uid: '%s' is not legal" % uid
        # if everything above passed, insert the code with requested uri
        else:
            STORAGE.put(code, uid=uid)
    # user has not requested a uri, make one instead
    else:
        uid = STORAGE.put(code)
    return "%s/%s\n" % (get_url(), uid)


if __name__ == '__main__':
    DESCRIPTIONS, STORAGE = {}, create_db(get_creds())
    run(host='localhost', port=8080)
