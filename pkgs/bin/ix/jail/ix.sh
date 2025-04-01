{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/jail
{% include 'jail.sh/base64' %}
EOF
base64 -d << EOF > ${out}/bin/confine
{% include 'confine.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
