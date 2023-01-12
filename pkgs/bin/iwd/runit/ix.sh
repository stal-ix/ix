{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/iwd
bin/iwd/runit/scripts
{% endblock %}
