{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/prometheus/d
bin/prometheus/ui
bin/prometheus/tool
{% endblock %}
