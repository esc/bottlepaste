#!/usr/bin/env python
import bottlepaste

creds = bottlepaste.get_creds()
db = bottlepaste.create_db(creds)

for i, document in enumerate(db._mongo.find()):
    id_ = document["_id"]
    code = db.get(id_)
    filename = 'dbdump/{0}_{1}'.format(i, id_)
    print "Writing: {0}".format(filename)
    with open(filename, 'w') as fp:
        fp.write(code)
