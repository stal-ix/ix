#!/usr/bin/env python3

import os
import sys
import subprocess

# for bld/ruby
if 'conftest' not in str(sys.argv):
    print(f'EXELINK {sys.argv}', file=sys.stderr)

TMPL = '''
#!/usr/bin/env sh
export DL_STUB_DEBUG=1
exec __bin__ "${@}"
'''

cmd = sys.argv[1:] + ['-L' + os.environ['tmp'] + '/lib']
oi = cmd.index('-o') + 1
out = cmd[oi]
cmd = cmd[:oi] + [out + '-bin'] + cmd[oi + 1:]

subprocess.check_call(cmd)

sys.stderr.write(TMPL.replace('__bin__', out + '-bin'))

with open(out, 'w') as f:
    f.write(TMPL.replace('__bin__', out + '-bin').strip() + '\n')

os.chmod(out, 0o777)
