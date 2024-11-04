#!/usr/bin/env python3

import sys
import json
import toml

print(json.dumps(toml.loads(sys.stdin.read()), sort_keys=True, indent=4))
