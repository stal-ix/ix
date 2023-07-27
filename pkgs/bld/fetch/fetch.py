#!/usr/bin/env python3

import os
import sys
import time
import subprocess

import urllib.error as ue
import urllib.request as ur

def fetch_url_wget(url, out):
    return subprocess.check_call(['wget', '--no-check-certificate', '-O', out, url], shell=False)

def fetch_url_curl(url, out):
    return subprocess.check_call(['curl', '-k', '-L', '--output', out, url], shell=False)

def iter_meth():
    while True:
        yield fetch_url_wget
        yield fetch_url_curl

def fetch_url(url, out):
    print(f'fetch {url} into {out}', file=sys.stderr)

    tout = 1.0

    for meth in iter_meth():
        try:
            return meth(url, out)
        except Exception as e:
            if '404' in str(e):
                raise e

            print(f'{e}, will sleep for {tout}')
            time.sleep(tout)
            tout = min(60.0, tout * 1.3)

def fetch(url):
    return fetch_url(url, os.path.basename(url))

fetch(sys.argv[1])
