{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > relocate
{% include 'reloc.py/base64' %}
EOF

chmod +x *
{% endblock %}
