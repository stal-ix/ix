{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > inline_build
{% include 'build/base64' %}
EOF

base64 -d << EOF > inline_install
{% include 'install/base64' %}
EOF

chmod +x inline_*
{% endblock %}
