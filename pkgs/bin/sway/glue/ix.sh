{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > sway-session
{% include 'run.sh/base64' %}
EOF

chmod +x *
{% endblock %}
