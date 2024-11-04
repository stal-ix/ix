#!/usr/bin/env python3

import sys
import json
import toml

print(toml.dumps(json.loads(sys.stdin.read())))
