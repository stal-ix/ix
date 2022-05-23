{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/unwrap(curses=netbsd)
{% endblock %}
