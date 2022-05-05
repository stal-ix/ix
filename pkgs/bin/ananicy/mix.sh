{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/ananicy/cpp
{% endblock %}

{% block run_data %}
bin/ananicy/rules
{% endblock %}
