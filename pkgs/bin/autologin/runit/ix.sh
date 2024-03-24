{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
export USER=root
export HOME=/home/root
fixtty /dev/tty{{slot or error()}}
exec subreaper setsid openvt -f -c {{slot}} -e /bin/sh -l
{% endblock %}
