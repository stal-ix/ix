{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
export GOMAXPROCS=2

exec /bin/dnsproxy \
    -v -o /proc/self/fd/1 \
{% if not yandex_vpn %}
    --ipv6-disabled \
{% endif %}
    --cache \
{% if not yandex_vpn %}
    --cache-optimistic \
    --cache-min-ttl=100 \
{% endif %}
    --upstream-mode=parallel \
    --hosts-file-enabled=false \
{% if yandex_vpn %}
    --timeout=3s \
    -u '[/yandex.net/yandex-team.ru/]84.252.160.1:53' \
    -u '[/ovpn.net.yandex.net/yanet.org/]1.1.1.1:53' \
    -u '[/ovpn.net.yandex.net/yanet.org/]8.8.8.8:53' \
{% endif %}
    -u 1.1.1.1:53 \
    -u 8.8.8.8:53 \
    -u 9.9.9.9:53 \
    -u [/local/]127.0.0.1:5354 \
    -u [/mesh/]192.168.100.0:53
{% endblock %}
