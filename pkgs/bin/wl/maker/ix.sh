{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/session
bin/wl/maker/unwrap
bin/dbus/session/runner(prog=wlmaker)
{% endblock %}
