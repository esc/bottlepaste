bottlepaste
===========

A command line pastebin akin to `sprunge.us <http://sprunge.us/>`_ but using
`bottle.py <http://bottlepy.org/>`_ as webframework and
`MongoDB <http://www.mongodb.org/>`_ via `PyMongo
<http://api.mongodb.org/python/current/>`_ as storage.

» Synposis
----------

.. code:: console

    $ <command> | curl -F 'bp=<-' [-F 'uid=<uid>'] DEPLOYMENT_URL

» Examples
----------

.. code:: console

    # Use curl to paste:
    $ cat bottlepaste.py | curl -F 'bp=<-' DEPLOYMENT_URL
    DEPLOYMENT_URL/ec42eda


.. code:: console

    # If you want a custom uid, use:
    $ cat bottlepaste.py | curl -F 'bp=<-' -F 'uid=bottlepaste.py' DEPLOYMENT_URL
    DEPLOYMENT_URL/bottlepaste.py

The ``uid`` parameter is subject to the following regex: ``'^[a-zA-Z0-9_\-\.]{3,23}$'``.
Also some well knowen file names are dissallowed.

For convenience you can download the `bpaste script <DEPLOYMENT_URL/bpaste>`_:

.. code:: sh

    #!/bin/sh
    exec curl -F 'bp=<-' DEPLOYMENT_URL

.. code:: console

    # Get the file and make it executable
    $ wget DEPLOYMENT_URL/bpaste
    $ chmod +x bpaste
    # Use bpaste to paste to bottlepaste:
    $ cat bpaste | ./bpaste
    DEPLOYMENT_URL/58f3857

» See also
----------

* `github repository <https://github.com/esc/bottlepaste>`_

.. footer:: **© 2012 Valentin Haenel -- proudly hosted on »** `cloudControl <https://www.cloudcontrol.com/>`_   **« using a database hosted on »** `mongolab <https://mongolab.com/home>`_ **«**
