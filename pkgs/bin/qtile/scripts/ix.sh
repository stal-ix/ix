{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/qtilewm
#!/usr/bin/env sh
exec qtile start -b wayland
EOF
chmod +x ${out}/bin/qtilewm
{% endblock %}
