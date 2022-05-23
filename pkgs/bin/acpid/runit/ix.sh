{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/acpid/d
bin/acpid/runit/scripts
{% endblock %}

{% block run_data %}
bin/acpid/rules
{% endblock %}
