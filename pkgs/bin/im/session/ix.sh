{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/im/pulse
bin/dbus/session
bin/im/session/scripts
{% endblock %}
