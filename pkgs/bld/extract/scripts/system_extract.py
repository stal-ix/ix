#!/usr/bin/env python3

import os
import pathlib
import shutil
import stat
import sys
import zipfile


def extract_zip(strip, source):
    root = pathlib.Path.cwd().resolve()

    with zipfile.ZipFile(source) as archive:
        for entry in archive.infolist():
            path = pathlib.PurePosixPath(entry.filename)

            if path.is_absolute() or '..' in path.parts:
                raise ValueError(f'unsafe zip path: {entry.filename}')

            parts = path.parts[strip:]

            if not parts:
                continue

            target = root.joinpath(*parts)

            try:
                target.parent.resolve().relative_to(root)
            except ValueError as error:
                raise ValueError(f'unsafe zip path: {entry.filename}') from error

            target.parent.mkdir(parents=True, exist_ok=True)
            mode = entry.external_attr >> 16

            if entry.is_dir():
                target.mkdir(parents=True, exist_ok=True)
            elif stat.S_ISLNK(mode):
                target.symlink_to(archive.read(entry).decode())
            else:
                with archive.open(entry) as source_file, target.open('wb') as target_file:
                    shutil.copyfileobj(source_file, target_file)

            if mode and not stat.S_ISLNK(mode):
                target.chmod(stat.S_IMODE(mode))


def main():
    strip = int(sys.argv[1])
    source = sys.argv[2]

    if zipfile.is_zipfile(source):
        extract_zip(strip, source)
    else:
        os.execvp('tar', [
            'tar', '-x', '-f', source,
            '--no-same-permissions',
            '--no-same-owner',
            '--strip-components', str(strip),
        ])


main()
