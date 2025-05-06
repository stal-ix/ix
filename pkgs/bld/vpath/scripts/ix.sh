{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/vpath.py
{% include 'vpath.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
