{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
export USER=root
export TERM=linux
export HOME=/home/root
export TMPDIR=\${PWD}
fixtty /dev/tty{{slot | defined('slot')}}
exec subreaper setsid openvt -f -c {{slot}} -e /bin/sh -l
{% endblock %}
