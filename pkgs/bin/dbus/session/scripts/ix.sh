{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > dbus-exec-session
{% include 'run.sh/base64' %}
EOF

chmod +x *
{% endblock %}
