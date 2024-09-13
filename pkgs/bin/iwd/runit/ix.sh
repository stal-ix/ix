{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iwd/runit/deps
etc/services/runit(srv_deps=bin/iwd/runit/deps,srv_dir=iwd,srv_command=exec iwd)
{% endblock %}
