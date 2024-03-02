{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/pmake
#!/usr/bin/env sh
exec bmake -m "\${FREEBSD_MK}" "\${@}"
EOF
chmod +x ${out}/bin/pmake
{% endblock %}
