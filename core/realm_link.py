#!/usr/bin/env python3
# Swap a realm symlink as root on the host. Realm.install() runs this through
# sudo when /ix/realm is not writable from where ix runs (a sandbox with a
# read-only /ix). Arguments are plain paths and ids: sud re-splits argv.

import os
import sys


def main(target, tmp, path, uid, gid):
    try:
        os.unlink(tmp)
    except FileNotFoundError:
        pass

    os.symlink(target, tmp)
    os.lchown(tmp, int(uid), int(gid))
    os.sync()
    os.rename(tmp, path)
    os.sync()


if __name__ == '__main__':
    main(*sys.argv[1:6])
