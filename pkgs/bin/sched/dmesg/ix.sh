{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
mkdir -p ${out}/etc/sched/{{delay}}

base64 -d << EOF > ${out}/etc/sched/{{delay}}/dmesg.sh
{% include 'dmesg.sh/base64' %}
EOF

mkdir -p ${out}/bin

base64 -d << EOF > ${out}/bin/klog
{% include 'klog.sh/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}
