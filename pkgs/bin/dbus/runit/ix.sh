{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/dbus/sys
bin/dbus/runit/scripts
etc/services/runit(srv_dir=dbus,srv_command=chrt -f 10 dbus-daemon --config-file=/etc/dbus.conf --nopidfile --syslog --nofork)
{% endblock %}
