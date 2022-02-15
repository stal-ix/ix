{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/{{delay}}; cd etc/sche.d/{{delay}}

base64 -d << EOF > prio.sh
{% include 'priod.sh/base64' %}
EOF
{% endblock %}
