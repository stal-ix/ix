{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/jail
{% include 'jail.sh/base64' %}
EOF
base64 -d << EOF >> ${out}/bin/jail0
{% include 'jail0.sh/base64' %}
EOF
{% if tmpfs %}
base64 -d << EOF >> ${out}/bin/jail0
{% include 'jail1.sh/base64' %}
EOF
{% endif %}
base64 -d << EOF >> ${out}/bin/jail0
{% include 'jail2.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
