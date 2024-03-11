{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/purge
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/{{delay}}; cd etc/sche.d/{{delay}}

base64 -d << EOF > homes.sh
{% include 'homes.sh/base64' %}
EOF
{% endblock %}
