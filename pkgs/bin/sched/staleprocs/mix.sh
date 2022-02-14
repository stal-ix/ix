{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/sched(delay=10)
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/10; cd etc/sche.d/10

base64 -d << EOF > staleprocs.sh
{% include 'staleprocs.sh/base64' %}
EOF
{% endblock %}
