{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin
base64 -d <<'EOF' > ${out}/bin/fusermount-sud
{% include 'bridge.py/base64' %}
EOF
chmod 0755 ${out}/bin/fusermount-sud
ln -s fusermount-sud ${out}/bin/fusermount
{% endblock %}
