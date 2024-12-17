import os
import sys
import json

with open(sys.argv[1]) as f:
    data = f.read()

vars = {}

exec(data, {'Var': lambda x: x}, vars)

deps = {}

exec(data, {'Var': lambda x: vars['vars'][x]}, deps)

flags = vars['vars']

flags['host_os'] = 'linux'
flags['host_cpu'] = 'x86_64'

flags['checkout_fuchsia'] = False
flags['checkout_android'] = False
flags['checkout_mac'] = False

def eval_condition(c):
    return eval(c, flags, {})

def check_dep(d):
    if 'condition' in d:
        return eval_condition(d['condition'])

    return True

def flt_deps():
    for k, v in deps['deps'].items():
        if 'http' in v:
            yield {'path': k, 'url': v}
        else:
            if check_dep(v):
                if 'url' in v:
                    yield {'path': k, 'url': v['url']}
                else:
                    yield {'path': k, 'dep': v}

def calc_urls(d):
    if u := d.get('url'):
        if 'googlesource.com' in u:
            yield u.replace('@', '/+archive/') + '.tar.gz'
        else:
            raise Exception(f'unknown url {u}')

    return

fo = open('fetch.sh', 'w')
uo = open('unpack.sh', 'w')
src = '${src}'

for d in flt_deps():
    p = d['path']

    for u in calc_urls(d):
        fo.write(f'{u}\n')
        uo.write(f'(\n    mkdir -p {p}\n    cd {p}\n    extract {src}/{os.path.basename(u)}\n)\n\n')
