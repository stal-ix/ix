{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/exec_script
{% include 'exec_script.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
