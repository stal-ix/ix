{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/mingetty/runit/slot(slot=1)
bin/mingetty/runit/slot(slot=2)
bin/mingetty/runit/slot(slot=3)
bin/mingetty/runit/slot(slot=4)
{% endblock %}
