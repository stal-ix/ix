{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/got/ix(curses=netbsd)
bin/openssh/client
{% endblock %}
