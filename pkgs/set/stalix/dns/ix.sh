{% extends '//die/hub.sh' %}

{% block run_deps %}
set/stalix/dns/{{dns_mngr}}
{% endblock %}

