{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sched/staleprocs(delay=10)
bin/mdevd/sys
set/system/1
{% endblock %}
