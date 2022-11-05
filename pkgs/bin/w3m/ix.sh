{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/w3m/unwrap(openssl=1,curses=netbsd)
{% endblock %}
