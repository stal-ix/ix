{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/w3m/unwrap(libopenssl_ver=1,curses=netbsd)
{% endblock %}
