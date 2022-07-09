{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > xdg-open
{% include 'xdg-open/base64' %}
EOF

base64 -d << EOF > xdg-open-stdin
{% include 'xdg-open-stdin/base64' %}
EOF

chmod +x *
{% endblock %}
