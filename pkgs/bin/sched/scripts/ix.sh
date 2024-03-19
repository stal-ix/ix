{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/sched{{delay}}; cd etc/services/sched{{delay}}

cat << EOF > cycle
#!/bin/sh

sleep {{delay}}

date

find /etc/sched/{{delay}} -type l -name '*.sh'| while read l; do
    echo "run \${l}"
    sh "\${l}" || true
    sleep 1
done
EOF

cat << EOF > run
#!/bin/sh
exec srv sched{{delay}} ${PWD}/cycle
EOF

chmod +x run cycle
{% endblock %}
