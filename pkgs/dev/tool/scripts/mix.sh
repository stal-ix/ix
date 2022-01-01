{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
dev/tool/python
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/fix_data_dir.py
{% include 'fix_data_dir.py/base64' %}
EOF
{% endblock %}
