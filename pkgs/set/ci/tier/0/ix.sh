{% extends '//die/hub.sh' %}

{% block run_deps %}
set/ci/unwrap(seed=1,slot=1,jail=1)
{% endblock %}
