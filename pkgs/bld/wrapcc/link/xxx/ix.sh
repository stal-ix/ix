{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > dynlink
{% include 'dynlink.sh/base64' %}
EOF

chmod +x *
{% endblock %}
