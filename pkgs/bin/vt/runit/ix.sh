{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/pidns
bin/fixtty
bin/runsrv
bin/session
bin/subreaper
bin/vt/runit/scripts(slot={{vt_slot}})
{% endblock %}
