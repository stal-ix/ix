{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/scx/rust/bpf
etc/services/runit(srv_deps=bin/scx/rust/bpf,srv_dir=scx,srv_command=exec scx_bpfland)
{% endblock %}
