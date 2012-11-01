bottlepaste
===========

A command line pastebin akin to `sprunge.us <http://sprunge.us/>`_ but using
`bottle.py <http://bottlepy.org/>`_ as webframework and
`MongoDB <http://www.mongodb.org/>`_ via `PyMongo
<http://api.mongodb.org/python/current/>`_ as storage.

Synposis
--------

.. code:: console

    $ <command> | curl -F 'bp=<-' [-F 'uid=<uid>'] DEPLOYMENT_URL

Example
-------

Use curl to paste:

.. code:: console

    $ cat bottlepaste.py | curl -F 'bp=<-' DEPLOYMENT_URL
    DEPLOYMENT_URL/ec42eda

If you want a custom uid, use:

.. code:: console

    $ cat bottlepaste.py | curl -F 'bp=<-' -F 'uid=bottlepaste.py' DEPLOYMENT_URL
    DEPLOYMENT_URL/bottlepaste.py

The ``uid`` is goverend by the following regex: ``'^[a-zA-Z0-9_\-\.]{3,23}$'``
and some well knowen file names are dissallowed.

See Also
--------

* `github repository <https://github.com/esc/bottlepaste>`_

.. footer:: © 2012 Valentin Haenel and proudly hosted on `cloudControl <https://cloudcontrol.com>`_
