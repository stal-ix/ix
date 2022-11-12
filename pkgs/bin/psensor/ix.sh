{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/lm/sensors
bin/psensor/unwrap
{% endblock %}
