{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox/bare(purec=musl/unwrap)
{% endblock %}
