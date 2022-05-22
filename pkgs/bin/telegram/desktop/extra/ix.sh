{% extends '//die/proxy.sh' %}

{% block install %}
{{hooks.check_exists('bin/xdg-open')}}

mkdir ${out}/bin; cd ${out}/bin

cat << EOF > tg
#!/usr/bin/env sh
exec telegram-desktop "\${@}"
EOF

chmod +x *
{% endblock %}
