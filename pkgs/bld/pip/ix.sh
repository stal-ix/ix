{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > py_exports
{% include 'py_exports.py/base64' %}
EOF

base64 -d << EOF > fix_dist
{% include 'fix_dist.sh/base64' %}
EOF

chmod +x *
{% endblock %}
