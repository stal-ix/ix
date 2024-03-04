{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > liblink
{% include 'liblink.py/base64' %}
EOF

chmod +x *
{% endblock %}
