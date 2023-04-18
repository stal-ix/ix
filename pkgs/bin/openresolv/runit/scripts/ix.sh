{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cd ${out}/etc

cat << EOF > resolvconf.conf
name_servers="::1 127.0.0.1"
name_servers_append="1.1.1.1 8.8.8.8 9.9.9.9"
resolv_conf=/var/run/resolvconf/resolv.conf
unbound_conf=/var/run/resolvconf/unbound.conf
dnsmasq_conf=/var/run/resolvconf/dnsmasq_conf.conf
dnsmasq_resolv=/var/run/resolvconf/dnsmasq_resolv.conf
EOF

ln -s /var/run/resolvconf/resolv.conf resolv.conf
{% endblock %}

{% block purge_broken_links %}
{% endblock %}

{% block chmod_ro %}
{% endblock %}
