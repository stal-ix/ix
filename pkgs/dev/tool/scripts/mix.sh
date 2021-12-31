{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
dev/tool/python
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/reparent.py
{% include 'reparent.py/base64' %}
EOF
{% endblock %}
