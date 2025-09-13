{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/pidns
{% include 'pidns.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
