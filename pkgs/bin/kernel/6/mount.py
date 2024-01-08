import json

T = {}

T['ix.sh'] = '''
{% extends '//die/hub.sh' %}
{% block run_deps %}
bin/kernel/6/__VER__/slot/0
{% endblock %}
'''

T['headers/ix.sh'] = '''
{% extends '//lib/linux/headers/ix.sh' %}
{% include '//bin/kernel/6/__VER__/ver.sh' %}
'''

T['slot/0/ix.sh'] = '''
{% extends '//bin/kernel/6/__VER__/slot/1/ix.sh' %}
{% block slot %}0{% endblock %}
'''

T['slot/1/ix.sh'] = '''
{% extends '//bin/kernel/6/__VER__/t/ix.sh' %}
{% block slot %}1{% endblock %}
{% block kernel_flags %}
{% include '//bin/kernel/6/__VER__/cfg' %}
{% endblock %}
'''

T['t/ix.sh'] = '''
{% extends '//bin/kernel/t/2/ix.sh' %}
{% include '//bin/kernel/6/__VER__/ver.sh' %}
{% block kernel_headers %}
bin/kernel/6/__VER__/headers
{% endblock %}
'''


def serve(x):
    ver = x[:x.index('/')]
    tpl = x[len(ver) + 1:]

    try:
        return T[tpl].replace('__VER__', ver)
    except KeyError:
        raise FileNotFoundError(x)
