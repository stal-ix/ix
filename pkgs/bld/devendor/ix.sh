{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > devendor
{% include 'devendor.sh/base64' %}
EOF

chmod +x *
{% endblock %}
