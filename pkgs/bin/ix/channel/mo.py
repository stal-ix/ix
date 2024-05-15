import os
import io
import sys
import zipfile

import core.vfs as cv

Z = zipfile.ZipFile(io.BytesIO(parent.serve('ix.zip')), 'r')

links = [
    ('bin/kernel/latest', 'bin/kernel/6/8'),
    ('lib/llvm/latest', 'lib/llvm/17'),
]

class ZFS:
    def __init__(self, root):
        self.root = root

    def normpath(self, p):
        for a, b in links:
            p = p.replace(a, b)

        return p

    def serve(self, x):
        try:
            zi = Z.getinfo(self.normpath(self.root + '/' + x))

            return Z.open(zi, 'r').read()
        except KeyError as e:
            a, sep, b = x.partition('/')

            if sep:
                return cv.VFS(ZFS(self.root + '/' + a)).serve(b)

            raise FileNotFoundError(x)

def serve(x):
    for n in Z.namelist():
        return ZFS(n + 'pkgs').serve(x)
