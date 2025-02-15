{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > devendor
{% include 'devendor.sh/base64' %}
EOF

base64 -d << EOF > devendor_c
{% include 'devendor_c.sh/base64' %}
EOF

base64 -d << EOF > devendor_h
{% include 'devendor_h.sh/base64' %}
EOF

chmod +x *
{% endblock %}
