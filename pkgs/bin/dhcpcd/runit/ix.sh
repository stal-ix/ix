{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/dhcpcd/sys
bin/dhcpcd/runit/scripts
{% endblock %}
