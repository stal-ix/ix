#!/usr/bin/env sh

import os
import sys

def it_it():
    for x in os.environ['IX_T_DIR'].split(':'):
        x = x.strip()

        if not x:
            continue

        xx = x + '/lib'

        if os.path.isdir(xx):
            yield xx

print(':'.join(it_it()))
