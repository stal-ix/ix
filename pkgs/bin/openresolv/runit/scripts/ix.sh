{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc ${out}/fix

cat << EOF > ${out}/etc/resolvconf.conf
name_servers="::1 127.0.0.1"
name_servers_append="1.1.1.1 8.8.8.8 9.9.9.9"
resolv_conf=/var/run/resolvconf/resolv.conf
unbound_conf=/var/run/resolvconf/unbound.conf
dnsmasq_conf=/var/run/resolvconf/dnsmasq_conf.conf
dnsmasq_resolv=/var/run/resolvconf/dnsmasq_resolv.conf
EOF

cat << EOF > ${out}/fix/resolv_conf_symlink.sh
ln -s /var/run/resolvconf/resolv.conf etc/resolv.conf
EOF
{% endblock %}
