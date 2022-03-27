{% extends '//mix/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > gtk-update-icon-cache
#!/usr/bin/env sh
EOF

cat << EOF > update-desktop-database
#!/usr/bin/env sh
EOF

chmod +x *
{% endblock %}
