{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > gtk-update-icon-cache
#!/usr/bin/env sh
EOF

cat << EOF > update-desktop-database
#!/usr/bin/env sh
EOF

base64 -d << EOF > igs-hook
{% include 'igs.sh/base64' %}
EOF

chmod +x *
{% endblock %}
