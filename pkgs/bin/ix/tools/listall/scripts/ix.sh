{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_listall
{% include 'ix_listall.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
