import json

K = json.loads(parent.serve('kernels.json'))
T = {}

T['ix.sh'] = '''
{% extends '//die/hub.sh' %}
{% block run_deps %}
bin/kernel/__VER__/slot/0
{% endblock %}
'''

T['headers/ix.sh'] = '''
{% extends '//lib/linux/headers/ix.sh' %}
{% include '//bin/kernel/__VER__/ver.sh' %}
'''

T['slot/0/ix.sh'] = '''
{% extends '//bin/kernel/__VER__/slot/1/ix.sh' %}
{% block slot %}0{% endblock %}
'''

T['slot/1/ix.sh'] = '''
{% extends '//bin/kernel/__VER__/t/ix.sh' %}
{% block slot %}1{% endblock %}
{% block kernel_flags %}
{% include '//bin/kernel/__VER__/cfg' %}
{% endblock %}
'''

T['t/ix.sh'] = '''
{% extends '//bin/kernel/t/2/ix.sh' %}
{% include '//bin/kernel/__VER__/ver.sh' %}
{% block kernel_headers %}
bin/kernel/__VER__/headers
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
    print(x)

    if '_' not in x:
        x = x.replace('/ix.sh', '/_/ix.sh')

        if '_' not in x:
            x = x + '/_'

        return serve(x)

    ver = x[:x.index('/_')]
    tpl = x[len(ver) + 3:]
    pat = ver.replace('/', '.') + '.'

    print(ver, tpl, pat)

    if tpl == 'ver.sh':
        return gen_v(best_match(pat))

    if tpl == 'cfg':
        return gen_c(best_match(pat))

    try:
        return T[tpl].replace('__VER__', ver + '/_')
    except KeyError:
        raise FileNotFoundError(x)
