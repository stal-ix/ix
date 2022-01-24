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
exec mdevd -f /etc/mdev.conf -C
EOF

chmod +x run
{% endblock %}
