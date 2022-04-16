{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/runsrv
bin/busybox
{% endblock %}

{% block install %}
cd ${out}

mkdir etc; cd etc

cat << EOF > ntp.conf
server 0.asia.pool.ntp.org
server 0.oceania.pool.ntp.org
server 0.europe.pool.ntp.org
server 0.north-america.pool.ntp.org
server 2.south-america.pool.ntp.org
driftfile /var/run/ntpd/ntp.drift
pidfile   /var/run/ntpd/ntp.pid
leapfile  /var/run/ntpd/ntp.leapseconds
EOF

mkdir -p services/ntpd; cd services/ntpd

cat << EOF > run
#!/bin/sh
exec srv ntpd ntpd -dd -n -N
EOF

chmod +x run
{% endblock %}
