import os
import sys
import json

data = sys.stdin.read().replace('\\\n', '')

def gen():
    for l in data.split('\n'):
        l = l.strip()

        if '$(call make' in l:
            yield list(x.strip() for x in l[7:].split(',')[:-1])

print(json.dumps(list(gen()), indent=4))
