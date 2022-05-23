{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/iwd/sys
bin/iwd/runit/scripts
{% endblock %}
