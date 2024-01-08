import json

K = json.loads(parent.serve('kernels.json'))
T = {}

T['headers/ix.sh'] = '''
{% extends '//lib/linux/headers/ix.sh' %}
{% include '//__NS__/ver.sh' %}
'''

T['ix.sh'] = '''
{% extends '//bin/kernel/t/2/ix.sh' %}
{% include '//__NS__/ver.sh' %}
{% block kernel_headers %}
__NS__/headers
{% endblock %}
{% block slot %}0{% endblock %}
{% block kernel_flags %}
{% include '//__NS__/cfg' %}
{% endblock %}
'''

V = '''
{% block kernel_version %}__FULL_VER__{% endblock %}
{% block fetch %}
__URL__
__SHA__
{% endblock %}
'''

C = '''
{% include '//bin/kernel/configs/__CFG__' %}
'''

def gen_v(descr):
    v = V

    v = v.replace('__FULL_VER__', descr['ver'].replace('.', '-'))
    v = v.replace('__URL__', descr['url'])
    v = v.replace('__SHA__', descr['sha'])

    return v

def gen_c(descr):
    return C.replace('__CFG__', descr['cfg'])

def best_match(prefix):
    for k in K:
        if k['ver'].startswith(prefix):
            return k

    raise Exception(f'can not find suitable kernel for {prefix}')

def serve(x):
    if '_' not in x:
        return serve(x.replace('/ix.sh', '/_/ix.sh'))

    xs = x.split('/_/')

    ver = xs[0]
    tpl = xs[1]
    pat = ver.replace('/', '.') + '.'

    if tpl == 'ver.sh':
        return gen_v(best_match(pat))

    if tpl == 'cfg':
        return gen_c(best_match(pat))

    try:
        return T[tpl].replace('__NS__', 'bin/kernel/' + ver + '/_')
    except KeyError:
        raise FileNotFoundError(x)
