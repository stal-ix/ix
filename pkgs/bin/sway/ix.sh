{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sway/stock
bin/dbus/session
bin/dbus/session/runner(prog=sway)
{% endblock %}
