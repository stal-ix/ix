{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/session
bin/hyprland/unwrap
bin/hyprland/scripts
{% endblock %}
