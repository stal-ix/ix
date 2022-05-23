{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir -p etc/services/dhcpcd; cd etc/services/dhcpcd

cat << EOF > run
#!/bin/sh
exec srv dhcpcd dhcpcd --nobackground --debug --config /etc/dhcpcd.conf
EOF

chmod +x run
{% endblock %}
