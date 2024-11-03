{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > chrw
{% include 'chrw/base64' %}
EOF

base64 -d << EOF > chro
{% include 'chro/base64' %}
EOF

chmod +x *
{% endblock %}
