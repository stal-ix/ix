{% extends '//mix/template/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/sched10; cd etc/services/sched10

base64 -d << EOF > cycle.sh
{% include 'cycle.sh/base64' %}
EOF

cat << EOF > run
#!/bin/sh
exec srv sched10 ${PWD}/cycle.sh
EOF

chmod +x run cycle.sh
{% endblock %}
