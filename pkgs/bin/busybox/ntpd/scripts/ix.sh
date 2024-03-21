{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/sched/{{delay}}

cat << EOF > ${out}/etc/sched/{{delay}}/ntpd.sh
ntpd -dd -n -q
hwclock -u -w
EOF
{% endblock %}
