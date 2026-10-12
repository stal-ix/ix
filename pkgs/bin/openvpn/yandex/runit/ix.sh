{% extends '//etc/services/runit/script/ix.sh' %}

{% set srv_dir = 'yandex_vpn' %}

{% block run_deps %}
bin/runsrv
bin/python
bin/openssh/client
bin/ip/route2
bin/openvpn/yandex
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/share/yandex-vpn
cat << EOF > ${out}/share/yandex-vpn/executables.json
{"openvpn": "{{intro('bin/openvpn/yandex').out_dir}}/bin/openvpn-yandex", "ip": "{{intro('bin/ip/route2').out_dir}}/bin/ip"}
EOF
cat << 'PY' > ${out}/share/yandex-vpn/controller.py
{% include 'controller.py' %}
PY
cat << EOF > ${out}/share/yandex-vpn/network-up
#!/bin/sh
exec /bin/python3 ${out}/share/yandex-vpn/controller.py up
EOF
chmod +x ${out}/share/yandex-vpn/network-up
{% endblock %}

{% block srv_command %}
exec /bin/python3 ${out}/share/yandex-vpn/controller.py
{% endblock %}
