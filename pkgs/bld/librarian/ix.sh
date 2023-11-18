{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > patchns
{% include 'patchns.sh/base64' %}
EOF

base64 -d << EOF > listsym
{% include 'listsym.sh/base64' %}
EOF

base64 -d << EOF > findlib
{% include 'findlib.py/base64' %}
EOF

chmod +x *
{% endblock %}
