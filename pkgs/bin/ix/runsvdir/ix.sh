{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/runsvdir
{% include 'run.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
