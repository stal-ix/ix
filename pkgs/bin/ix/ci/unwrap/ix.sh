{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/python
bin/git/unwrap
bin/ix/ci/cycle
etc/user/{{user}}
bin/sched/purge(delay=100,trash_dir={{wd}}/ix_root/trash)
etc/services/runit(srv_dir=ci_cycle_{{user}},srv_user={{user}},srv_command=exec ci_cycle)
{% endblock %}
