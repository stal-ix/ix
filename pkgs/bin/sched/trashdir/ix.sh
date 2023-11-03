{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sched/purge(trash_dir=/ix/trash)
{% endblock %}
