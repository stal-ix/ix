{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > wrapcc
{% include 'wrapcc.krk/base64' %}
EOF

chmod +x *
{% endblock %}
