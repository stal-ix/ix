{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wayfire/ix
bin/dbus/session
bin/dbus/session/runner(prog=wayfire)
{% endblock %}
