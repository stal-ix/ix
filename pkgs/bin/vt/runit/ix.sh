{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/runsrv
bin/ix/session
{% if pidns %}
bin/ix/pidns
{% endif %}
bin/subreaper
bin/vt/runit/scripts(slot={{vt_slot}})
{% endblock %}
