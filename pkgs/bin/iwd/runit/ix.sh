{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/iwd/d
bin/iwd/runit/conf
etc/services/runit(srv_dir=iwd,srv_command=exec iwd)
{% endblock %}
