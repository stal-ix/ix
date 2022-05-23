{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/dbus/sys
bin/dbus/runit/scripts
{% endblock %}
