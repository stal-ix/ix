{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > check_realm
{% include 'check.py/base64' %}
EOF

chmod +x *
{% endblock %}
