{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
dev/build/python/mix.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/gen_py_init.py
{% include 'gen_py_init.py/base64' %}
EOF
{% endblock %}
