{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/mdevd
{% endblock %}

{% block install %}
cd ${out}; mkdir etc; cd etc

base64 -d << EOF > mdev.conf
{% include 'bad.conf/base64' %}
EOF

echo >> mdev.conf

mkdir -p runit/1.d; cd runit/1.d

cat << EOF > 5-mdevd-coldplug.sh
mdevd-coldplug
EOF

cd ../..

mkdir -p services/mdevd; cd services/mdevd

cat << EOF > run
#!/bin/sh
mkdir -p /var/run/mdevd
cd /var/run/mdevd
exec flock lock mdevd -O 4 -f /etc/mdev.conf -C 1>>out 2>>out
EOF

chmod +x run
{% endblock %}
