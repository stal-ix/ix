{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_mkfs
{% include 'ix_mkfs.sh/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_sync
{% include 'ix_sync.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
