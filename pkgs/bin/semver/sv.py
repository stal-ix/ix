import sys
import json
import hashlib
import tarfile


def sha(b):
    return hashlib.sha256(b).hexdigest()


def struct_sha(s):
    return sha(json.dumps(s, sort_keys=True).encode())


def read_rec(r):
    if r:
        return r.read()

    return b''


def semantic_checksum(path):
    r = []

    with tarfile.open(path) as tf:
        for rec in tf.getmembers():
            try:
                m = sha(read_rec(tf.extractfile(rec)))
            except KeyError:
                m = 'key error'

            v = [
                rec.name,
                rec.size,
                rec.mode,
                str(rec.type),
                rec.linkname,
                m,
            ]

            r.append(struct_sha(v))

    return struct_sha(list(sorted(r)))


if len(sys.argv) == 2:
    print(semantic_checksum(sys.argv[1]))
else:
    was = sys.argv[2]
    got = semantic_checksum(sys.argv[1])

    assert was == got, got
