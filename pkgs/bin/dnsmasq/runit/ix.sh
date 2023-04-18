{% extends '//die/hub.sh' %}

{% set opts %}
-2=lo
--no-hosts
--log-debug
--all-servers
--log-queries
--no-negcache
--log-queries
--filter-AAAA
--user=dnsmasq
--interface=lo
--cache-size=1000
--clear-on-reload
--keep-in-foreground
--pid-file=/var/run/dnsmasq/pid
--conf-file=/var/run/resolvconf/dnsmasq_conf.conf
--resolv-file=/var/run/resolvconf/dnsmasq_resolv.conf
--log-facility=/var/run/dnsmasq/log
{% endset %}

{% block run_deps %}
etc/user/dnsmasq
bin/dnsmasq/lite
etc/services/runit(srv_dir=dnsmasq,srv_command=exec /bin/dnsmasq {{ix.fix_list(opts)}})
{% endblock %}
