{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin
base64 -d << EOF > ${out}/bin/yandex-vpn
{% include 'controller.py/base64' %}
EOF
base64 -d << EOF > ${out}/bin/yandex-vpn-up
{% include 'network-up.sh/base64' %}
EOF
chmod +x ${out}/bin/*
mkdir -p ${out}/share/yandex-vpn
base64 -d << EOF > ${out}/share/yandex-vpn/networks.json
{% include 'networks.json/base64' %}
EOF
{% endblock %}
