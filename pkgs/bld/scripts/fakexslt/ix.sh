{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > xsltproc
#!/usr/bin/env python3

import sys

with open(sys.argv[sys.argv.index('-o') + 1], 'w') as f:
    pass
EOF

chmod +x *
{% endblock %}
