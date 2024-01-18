{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wl/maker/d
bin/dbus/session
bin/wl/maker/apps
bin/dbus/session/runner(prog=wlmaker)
{% endblock %}
