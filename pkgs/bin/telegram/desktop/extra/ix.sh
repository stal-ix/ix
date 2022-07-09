{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > tg
#!/usr/bin/env sh
exec telegram-desktop "\${@}"
EOF

chmod +x *
{% endblock %}
