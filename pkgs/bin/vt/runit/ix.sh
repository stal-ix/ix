{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/runsrv
bin/session
bin/ix/pidns
bin/subreaper
bin/vt/runit/scripts(slot={{vt_slot}})
{% endblock %}
