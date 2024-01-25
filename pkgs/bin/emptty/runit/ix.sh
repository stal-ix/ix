{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/runsrv
bin/emptty
bin/emptty/runit/scripts(slot={{vt_slot}})
{% endblock %}
