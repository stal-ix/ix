{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/ananicy
bin/ananicy/runit/scripts
{% endblock %}
