{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/got/unwrap(curses=netbsd)
{% endblock %}
