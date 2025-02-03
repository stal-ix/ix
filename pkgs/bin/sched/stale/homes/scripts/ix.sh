{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/sched/{{delay}}; cd etc/sched/{{delay}}

base64 -d << EOF > homes.sh
{% include 'homes.sh/base64' %}
EOF
{% endblock %}
