{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/seatd/sys
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/services/seatd; cd etc/services/seatd

cat << EOF > run
#!/bin/sh
exec srv seatd ${PWD}/seatd
EOF

cat << EOF > seatd
#!/bin/sh
export SEATD_LOGLEVEL=debug
rm -f seatd.sock
exec seatd -u root -s seatd.sock
EOF

chmod +x run seatd
{% endblock %}
