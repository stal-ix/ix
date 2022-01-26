{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/dhcpcd/sys
{% endblock %}

{% block install %}
cd ${out}

mkdir -p etc/services/dhcpcd; cd etc/services/dhcpcd

cat << EOF > run
#!/bin/sh
mkdir -p /var/run/dhcpcd
cd /var/run/dhcpcd
exec flock lock dhcpcd --nobackground --debug --config /etc/dhcpcd.conf 1>stdout 2>stderr
EOF

chmod +x run
{% endblock %}
