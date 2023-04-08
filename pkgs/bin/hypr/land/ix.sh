{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/session
bin/hypr/land/ix
bin/dbus/session/runner(prog=Hyprland)
{% endblock %}
