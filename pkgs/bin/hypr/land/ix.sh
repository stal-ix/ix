{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/session
bin/hypr/land/ix(libcplpl_ver=17)
bin/dbus/session/runner(prog=Hyprland)
{% endblock %}
