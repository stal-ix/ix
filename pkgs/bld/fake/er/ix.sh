{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > {{tool_name}}
#!/usr/bin/env python3

import os
import sys

def get_out(a):
    if '-o' in a:
        return a[a.index('-o') + 1]

    if '--output' in a:
        return a[a.index('--output') + 1]

    for x in reversed(a):
        if '/' in x:
            return x

    if len(a) > 0:
        return a[-1]

p = get_out(sys.argv[1:])

if p and not os.path.exists(p):
    try:
        with open(p, 'w') as f:
            pass
    except Exception as e:
        pass
EOF

chmod +x *
{% endblock %}
