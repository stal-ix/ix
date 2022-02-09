{% extends '//set/system/1/mix.sh' %}

{% block run_deps %}
bin/sched/staleprocs
{{super()}}
{% endblock %}
