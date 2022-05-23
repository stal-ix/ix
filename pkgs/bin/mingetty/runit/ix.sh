{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/runsrv
bin/mingetty
bin/subreaper
bin/mingetty/runit/slot(slot=1)
bin/mingetty/runit/slot(slot=2)
bin/mingetty/runit/slot(slot=3)
bin/mingetty/runit/slot(slot=4)
{% if failsafe %}
bin/mingetty/runit/root(slot=5)
{% else %}
bin/mingetty/runit/slot(slot=5)
{% endif %}
{% endblock %}
