import hashlib
import json
import time
import zlib
from bottle import route, run, request, response, abort
from pymongo import Connection
from bson.binary import Binary

BASE_URL = 'http://localhost:8080'


def description(filename='INDEX.rst'):
    with open(filename) as readme:
        return readme.read().replace("$DEPLOYMENT_URL", BASE_URL)


def creds():
    """ Try to obatin the credentials dictionary. """
    try:
        # get name of file from env
        cred_file = os.environ.get('CRED_FILE', '')
        # read file contents
        with open(cred_file, 'r') as cred_fp:
            cred_str = cred_fp.read()
    # in case the file doesn't exist
    except IOError:
        return {}
    try:
        # try to convert from json to dict
        return json.loads(cred_str)
    # in case the file contains nothing or garbage
    except ValueError:
        return {}


DESCRIPTION = description()
CREDS = creds()
COLLECTION = 'paste_collection'


class Database(object):

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


class MongoDB(Database):

    def __init__(self, mongodburi):
        self._description = 'mongo'
        db_name = mongodburi[mongodburi.rfind('/') + 1:]
        self._mongo = Connection(mongodburi)[db_name][COLLECTION]

    def __contains__(self, uid):
        return self._mongo.find_one(uid) is not None

    def get(self, uid):
        entry = self._mongo.find_one(uid)
        return zlib.decompress(entry['code']) if entry is not None else None

    def put(self, code):
        digest = Database.hash_(code)
        if digest not in self:
            self._mongo.insert(Database.make_ds(digest,
                Binary(zlib.compress(code))),
                    safe=True)
        return digest


class DictDB(Database, dict):

    def __init__(self):
        self._description = 'dict'

    def get(self, uid):
        try:
            return zlib.decompress(self[uid]['code'])
        except KeyError:
            return None

    def put(self, code):
        digest = Database.hash_(code)
        if digest not in self:
            ds = Database.make_ds(digest, zlib.compress(code))
            self[digest] = ds
        return digest


def create_db():
    try:
        # try to init mongodb connection
        mongodburi = CREDS['MONGOLAB']['MONGOLAB_URI']
        return MongoDB(mongodburi)
    # fallback to simple storage if not possible
    except (KeyError):
        return DictDB()

storage = create_db()


@route('/')
def index():
    response.content_type = 'text/plain; charset=utf-8'
    return DESCRIPTION


@route('/<uid>')
def show(uid):
    response.content_type = 'text/plain; charset=utf-8'
    code = storage.get(uid)
    if code is None:
        abort(404, "Sorry, paste: '%s' Not found." % uid)
    else:
        return code


@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    uid = storage.put(code)
    return "%s/%s\n" % (BASE_URL, uid)

run(host='localhost', port=8080)
