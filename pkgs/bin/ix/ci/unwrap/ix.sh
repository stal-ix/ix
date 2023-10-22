{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bin/git/unwrap
etc/user/{{user}}
bin/ix/ci/cycle
etc/services/runit(srv_dir=ci_cycle_{{user}},srv_user={{user}},srv_command=exec ci_cycle)
{% endblock %}
