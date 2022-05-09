{% extends '//mix/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > xdg-open
#!/usr/bin/env sh
exec epiphany "\${@}"
EOF

chmod +x *
{% endblock %}
