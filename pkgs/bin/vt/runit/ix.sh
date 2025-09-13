{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/runsrv
bin/subreaper
{% if enclave %}
bin/ix/enclave
bin/ix/session
{% endif %}
bin/vt/runit/scripts(slot={{vt_slot}})
{% endblock %}
