{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc
cat << EOF > ${out}/etc/dnsmasq.conf
conf-file=/var/run/resolvconf/dnsmasq_conf.conf
resolv-file=/var/run/resolvconf/dnsmasq_resolv.conf
EOF
{% endblock %}
