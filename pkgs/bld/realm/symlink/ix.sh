{% extends '//die/gen.sh' %}

{% block run_deps %}
bld/sh
bld/box
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > prepare_realm
{% include 'realm.py/base64' %}
EOF

chmod +x *
{% endblock %}
