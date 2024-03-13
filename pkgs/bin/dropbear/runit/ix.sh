{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/dropbear
etc/host/keys
bin/dropbear/runit/scripts
{% endblock %}
