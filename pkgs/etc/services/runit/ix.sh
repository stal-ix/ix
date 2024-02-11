{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
etc/services/runit/script
{% endblock %}
