{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/mingetty/runit/slot(slot=5,mingetty_args=--autologin=root)
{% endblock %}
