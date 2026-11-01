{% extends '//bin/dns/proxy/runit/script/ix.sh' %}

{% block srv_command %}
export GOMAXPROCS=2

exec /bin/dnsproxy \
    -v -o /proc/self/fd/1 \
    --cache \
    --upstream-mode=parallel \
    --hosts-file-enabled=false \
    --timeout=3s \
    -u '[/yandex.net/yandex-team.ru/]84.252.160.1:53' \
    -u '[/ovpn.net.yandex.net/yanet.org/]https://1.1.1.1/dns-query' \
    -u '[/ovpn.net.yandex.net/yanet.org/]https://8.8.8.8/dns-query' \
    -u https://1.1.1.1/dns-query \
    -u https://8.8.8.8/dns-query \
    -u https://9.9.9.9/dns-query \
    -u [/local/]127.0.0.1:5354 \
    -u [/mesh/]192.168.100.0:53
{% endblock %}
