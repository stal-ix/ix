{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/unbound.conf
server:
    username: unbound
    num-threads: 4
    logfile: ""

include: "/var/run/resolvconf/unbound.conf"
EOF
{% endblock %}
