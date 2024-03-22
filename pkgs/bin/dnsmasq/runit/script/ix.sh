{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
exec subreaper /bin/dnsmasq \
    -2=lo \
    --no-hosts \
    --log-debug \
    --all-servers \
    --log-queries \
    --no-negcache \
    --log-queries \
    --filter-AAAA \
    --user=dnsmasq \
    --interface=lo \
    --cache-size=1000 \
    --clear-on-reload \
    --keep-in-foreground \
    --server=/local/127.0.0.1#5354 \
    --pid-file=/var/run/dnsmasq/pid \
    --log-facility=/var/run/dnsmasq/log \
    --conf-file=/var/run/resolvconf/dnsmasq_conf.conf \
    --resolv-file=/var/run/resolvconf/dnsmasq_resolv.conf
{% endblock %}
