{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/runsrv
bin/emptty
bin/subreaper
bin/emptty/runit/slot(slot=1)
bin/emptty/runit/slot(slot=2)
bin/emptty/runit/slot(slot=3)
bin/emptty/runit/slot(slot=4)
{% if failsafe %}
bin/autologin(slot=5)
{% else %}
bin/emptty/runit/slot(slot=5)
{% endif %}
{% endblock %}
