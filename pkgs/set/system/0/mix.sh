{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sched/staleprocs(delay=10)
bin/mdevd/runit
bin/sndio/runit
set/system/1
{% endblock %}
