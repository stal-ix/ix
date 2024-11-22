{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/scx
etc/services/runit(srv_deps=bin/scx,srv_dir=scx,srv_command=exec scx_rustland)
{% endblock %}
