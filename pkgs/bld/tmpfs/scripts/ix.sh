{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/tmpfs
{% include 'tmpfs.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
