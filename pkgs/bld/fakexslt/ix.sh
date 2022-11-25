{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > xsltproc
#!/usr/bin/env python3

import sys

def main(a):
    if '-o' not in a:
        return

    with open(a[a.index('-o') + 1], 'w') as f:
        pass

main(sys.argv)
EOF

chmod +x *
{% endblock %}
