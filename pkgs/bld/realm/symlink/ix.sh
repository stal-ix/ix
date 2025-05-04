{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > ix_install
{% include 'ix_install.py/base64' %}
EOF

base64 -d << EOF > ix_postinstall
{% include 'ix_postinstall.sh/base64' %}
EOF

chmod +x *
{% endblock %}
