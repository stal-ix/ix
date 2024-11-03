{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/seatd; cd etc/services/seatd

cat << EOF > run
#!/bin/sh
exec srv seatd ${PWD}/seatd
EOF

cat << EOF > seatd
#!/bin/sh
chmod 0666 /dev/dri/*
export SEATD_LOGLEVEL=debug
rm -f seatd.sock
exec seatd -u root
EOF

chmod +x run seatd
{% endblock %}
