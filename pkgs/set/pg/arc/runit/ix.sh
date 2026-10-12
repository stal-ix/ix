{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_user_prepare %}
# Arc needs at least 10240 descriptors. Set both limits before dropping root.
ulimit -n 65536
{{super()}}
{% endblock %}

{% block srv_command %}
exec /bin/pg-arc-mount
{% endblock %}
