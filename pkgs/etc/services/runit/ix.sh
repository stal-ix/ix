{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/su/exec
etc/services/runit/script
{% endblock %}
