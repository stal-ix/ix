{% extends '//die/gen.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > replace
{% include 'replace.py/base64' %}
EOF

chmod +x *
{% endblock %}
