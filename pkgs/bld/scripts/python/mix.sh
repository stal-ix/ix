{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/gen_py_init.py
{% include 'gen_py_init.py/base64' %}
EOF
{% endblock %}
