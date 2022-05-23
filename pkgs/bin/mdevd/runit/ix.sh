{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdevd
bin/runsrv
bin/mdevd/runit/scripts
{% endblock %}
