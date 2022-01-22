{% extends '//lib/seat/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mkdir -p etc/services/seatd; cd etc/services/seatd
cat << EOF > run
#!/bin/sh
rm -rf /var/run/seatd.sock
exec seatd -s /var/run/seatd.sock
EOF
chmod +x run
{% endblock %}
