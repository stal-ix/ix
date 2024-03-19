{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/purge
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sched/{{delay}}; cd etc/sched/{{delay}}

base64 -d << EOF > srvdirs.sh
{% include 'srvdirs.sh/base64' %}
EOF
{% endblock %}
