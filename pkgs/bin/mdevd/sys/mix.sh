{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/mdevd
{% endblock %}

{% block install %}
cd ${out}; mkdir etc; cd etc

base64 -d << EOF > mdev.conf
{% include 'bad.conf/base64' %}
EOF

echo >> mdev.conf

mkdir -p services/mdevd; cd services/mdevd

cat << EOF > run
#!/bin/sh
mkdir -p /var/run/mdevd
cd /var/run/mdevd
exec mdevd -O 4 -f /etc/mdev.conf -C 1>stdout 2>stderr
EOF

chmod +x run
{% endblock %}
