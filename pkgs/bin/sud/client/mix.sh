{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sud/client/unwrap(curses=netbsd)
{% endblock %}
