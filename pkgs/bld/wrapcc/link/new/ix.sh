{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > exelink
{% include 'exelink.py/base64' %}
EOF

chmod +x *
{% endblock %}
