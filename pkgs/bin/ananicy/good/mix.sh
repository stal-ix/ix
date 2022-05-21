{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/ananicy.d; cd ${out}/etc/ananicy.d

cat << EOF > sway.rules
{"name": "sway", "rtprio": 10, "sched": "fifo"}
EOF

cat << EOF > epiphany.rules
{"name": "epiphany-bin", "nice": -10}
EOF

cat << EOF > webkit.rules
{"name": "WebKitWebProcess", "nice": -10}
{"name": "WebKitNetworkProcess", "nice": -10}
EOF
{% endblock %}
