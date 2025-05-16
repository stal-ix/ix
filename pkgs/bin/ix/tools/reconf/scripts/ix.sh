{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_reconf
{% include 'ix_reconf.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
