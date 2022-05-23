{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/seatd/sys
bin/seatd/runit/scripts
{% endblock %}
