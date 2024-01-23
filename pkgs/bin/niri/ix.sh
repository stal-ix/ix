{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/niri/unwrap
bin/dbus/session
bin/dbus/session/runner(prog=niri)
{% endblock %}
