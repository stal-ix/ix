{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/session
{% include 'session/base64' %}
EOF

base64 -d << EOF > ${out}/bin/user-session
{% include 'user-session/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}
