{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/dropbear
bin/dropbear/runit/scripts
{% endblock %}
