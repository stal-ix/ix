{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/runsrv
bin/dhcpcd/sys
{% endblock %}

{% block install %}
cd ${out}

mkdir -p etc/services/dhcpcd; cd etc/services/dhcpcd

cat << EOF > run
#!/bin/sh
exec srv dhcpcd dhcpcd --nobackground --debug --config /etc/dhcpcd.conf
EOF

chmod +x run
{% endblock %}
