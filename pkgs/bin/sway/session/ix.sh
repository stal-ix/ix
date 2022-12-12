{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/session
bin/sway/session/scripts
{% endblock %}
