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
{% include '//bin/kernel/configs/__CFG__' %}
{% endblock %}
'''

T['ver.sh'] = '''
{% block kernel_version %}__FULL_VER__{% endblock %}
{% block fetch %}
__URL__
__SHA__
{% endblock %}
'''

def subst(v, descr):
    v = v.replace('__FULL_VER__', descr['ver'].replace('.', '-'))
    v = v.replace('__URL__', descr['url'])
    v = v.replace('__SHA__', descr['sha'])
    v = v.replace('__CFG__', descr['cfg'])
    v = v.replace('__NS__', descr['ns'])

    return v

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
    ker = best_match(ver.replace('/', '.') + '.')
    rpl = dict(ker.items(), ns='bin/kernel/' + ver + '/_')

    try:
        return subst(T[tpl], rpl)
    except KeyError:
        raise FileNotFoundError(x)
