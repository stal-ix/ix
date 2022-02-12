{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/sched/10
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/10; cd etc/sche.d/10

base64 -d << EOF > prio.sh
{% include 'priod.sh/base64' %}
EOF
{% endblock %}
