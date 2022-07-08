{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/stalld
bin/runsrv
bin/stalld/runit/scripts
{% endblock %}
