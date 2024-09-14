{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/runit/deps
etc/services/runit(srv_deps=bin/dbus/runit/deps,srv_dir=dbus,srv_command=exec chrt -f 10 dbus-daemon --config-file=/etc/dbus.conf --nopidfile --syslog --nofork)
{% endblock %}
