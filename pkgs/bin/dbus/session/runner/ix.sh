{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > {{prog}}-session
#!/usr/bin/env sh
exec dbus-exec-session {{prog}}
EOF

chmod +x *
{% endblock %}
