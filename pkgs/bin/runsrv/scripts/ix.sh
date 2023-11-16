{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > srv
{% include 'srv/base64' %}
EOF

chmod +x srv
{% endblock %}
