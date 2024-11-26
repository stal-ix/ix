{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/scx/rust/land
etc/services/runit(srv_deps=bin/scx/rust/land,srv_dir=scx,srv_command=exec chrt -f 1 scx_rustland)
{% endblock %}
