{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/squid/unwrap(openssl=1)
{% endblock %}
