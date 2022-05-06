{% extends '//mix/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/ananicy.d; cd ${out}/etc/ananicy.d

cat << EOF > sway.rules
{"name": "sway", "rtprio": 10, "sched": "fifo"}
EOF

cat << EOF > epiphany.rules
{"name": "epiphany-bin", "rtprio": 9, "sched": "rr"}
EOF

cat << EOF > webkit.rules
{"name": "WebKitWebProcess", "rtprio": 8, "sched": "rr"}
{"name": "WebKitNetworkProcess", "rtprio": 8, "sched": "rr"}
EOF
{% endblock %}
