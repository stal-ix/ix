{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin

cat << EOF > ${out}/bin/valac
#!/usr/bin/env sh
exec valac-0.56 \${VALAFLAGS} "\${@}"
EOF

chmod +x ${out}/bin/valac
{% endblock %}
