{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/unbound.conf
server:
    username: unbound
    logfile: ""

include: "/var/run/resolvconf/unbound.conf"
EOF
{% endblock %}
