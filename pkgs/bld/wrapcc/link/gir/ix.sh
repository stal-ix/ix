{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > girlink
{% include 'girlink.py/base64' %}
EOF

chmod +x *
{% endblock %}
