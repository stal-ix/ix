{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sched/staleprocs
set/system/1
{% endblock %}
