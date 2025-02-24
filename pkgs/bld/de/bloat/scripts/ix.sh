{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > debloat
{% include 'debloat.sh/base64' %}
EOF

chmod +x *
{% endblock %}
