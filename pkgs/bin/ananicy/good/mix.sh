{% extends '//mix/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/ananicy.d; cd ${out}/etc/ananicy.d

cat << EOF > sway.rules
{"name": "sway", "rtprio": 99, "sched": "rr"}
EOF

cat << EOF > epiphany.rules
{"name": "epiphany-bin", "rtprio": 90, "sched": "rr"}
EOF

cat << EOF > webkit.rules
{"name": "WebKitWebProcess", "rtprio": 80, "sched": "rr"}
{"name": "WebKitNetworkProcess", "rtprio": 80, "sched": "rr"}
EOF
{% endblock %}
