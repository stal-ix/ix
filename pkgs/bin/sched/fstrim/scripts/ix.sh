{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/sched/{{delay}}; cd etc/sched/{{delay}}

base64 -d << EOF > fstrim.sh
{% include 'fstrim.sh/base64' %}
EOF
{% endblock %}
