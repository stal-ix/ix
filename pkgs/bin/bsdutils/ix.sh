{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bsdutils/box(curses=netbsd)
{% endblock %}
