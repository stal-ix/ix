{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > trimpc
{% include 'trimpc.py/base64' %}
EOF

chmod +x *
{% endblock %}
