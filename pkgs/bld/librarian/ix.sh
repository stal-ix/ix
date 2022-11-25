{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > patchns
{% include 'patchns.sh/base64' %}
EOF

base64 -d << EOF > fixallns
{% include 'fixallns.sh/base64' %}
EOF

base64 -d << EOF > safeex
{% include 'safeex.py/base64' %}
EOF

base64 -d << EOF > safear
{% include 'safear.py/base64' %}
EOF

base64 -d << EOF > joinar
{% include 'joinar.sh/base64' %}
EOF

base64 -d << EOF > substr
{% include 'substr.py/base64' %}
EOF

base64 -d << EOF > listsym
{% include 'listsym.sh/base64' %}
EOF

base64 -d << EOF > findlib
{% include 'findlib.py/base64' %}
EOF

chmod +x *
{% endblock %}
