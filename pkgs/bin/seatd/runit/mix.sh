{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/seatd/sys
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/services/seatd; cd etc/services/seatd

cat << EOF > run
#!/bin/sh
mkdir -p /var/run/seatd
cd /var/run/seatd
exec flock lock /etc/services/seatd/seatd 1>>out 2>>out
EOF

cat << EOF > seatd
#!/bin/sh
export SEATD_LOGLEVEL=debug
rm -rf seatd.sock
exec seatd -u root -s seatd.sock
EOF

chmod +x run seatd
{% endblock %}
