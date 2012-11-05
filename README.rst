bottlepaste
-----------

A command line pastebin akin to `sprunge.us <http://sprunge.us/>`_ but using
`bottle.py <http://bottlepy.org/docs/dev/bottle.py>`_ as webframework and
`MongoDB <http://www.mongodb.org/>`_ via `PyMongo
<http://api.mongodb.org/python/current/>`_ as storage.

The author deploys it on `cloudControl <https://www.cloudcontrol.com/>`_ using
a MongoDB provided by `mongolab <https://www.mongolab.com/home>`_ as:

* `bp.zetatech.org <http://bp.zetatech.org/>`_
* `bottlepaste.zetatech.org <http://bottlepaste.zetatech.org/>`_
* `bottlepaste.cloudcontrolled.com <http://bottlepaste.cloudcontrolled.com/>`_

Enjoy!

Stability
---------

This software is in alpha stage. Don't depend in any way on the links.

``index.html``
--------------

The main page use a variation of the docutils ``voidspace.css`` and ``vs.css``
for syntax highlighting. Because docutils is too difficult to use from python,
we chose an interim solution and the index page is checked into the repository
for now and then templated inside bottlepaste with a URL. The styles are
embedded.

To regenerate the page
use::

    $ rst2html.py --stylesheet-path=bottlepaste.css,github.css index.rst index.tpl

Deployment
----------

The app is *meant* to be deployed to cloudControl, hence all the additional
files are in master. See the ``magic.sh`` script for how it's done.
Incidentally, since cloudControl uses ``buildpacks`` you *should* be able tp
deploy this app to heroku too.

TODO
----

* pygments highlighting
* cron to clean db
* info.html to show info and statistics
* pasteform

Copyright
---------

© 2012 Valentin Haenel

bottlepaste is licensed under the terms of the MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
