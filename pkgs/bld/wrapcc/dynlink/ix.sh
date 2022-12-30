{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/dlfcn
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > dynlink
{% include 'dynlink.py/base64' %}
EOF

chmod +x *
{% endblock %}
