{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/runsrv
bin/vt/runit/scripts(slot={{vt_slot}})
{% endblock %}
