{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/session
bin/hyprland/unwrap
bin/dbus/session/runner(prog=Hyprland)
{% endblock %}
