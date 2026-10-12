{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
exec /bin/yandex-vpn
{% endblock %}
