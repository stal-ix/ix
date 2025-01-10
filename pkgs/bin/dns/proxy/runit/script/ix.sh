{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
export GOMAXPROCS=2

exec /bin/dnsproxy \
    -v -o /proc/self/fd/1 \
    --ipv6-disabled \
    --cache \
    --cache-optimistic \
    --cache-min-ttl=100 \
    --upstream-mode=parallel \
    --hosts-file-enabled=false \
    -u 1.1.1.1:53 \
    -u 8.8.8.8:53 \
    -u 9.9.9.9:53 \
    -u [/local/]127.0.0.1:5354
{% endblock %}
