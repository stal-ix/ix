{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > gen_py_init
{% include 'gen_py_init.py/base64' %}
EOF

chmod +x *
{% endblock %}
