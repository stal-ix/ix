{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/unbound.conf
server:
    username: unbound
    logfile: "/var/run/unbound/unbound.log"

include: "/var/run/resolvconf/unbound.conf"
EOF
{% endblock %}
