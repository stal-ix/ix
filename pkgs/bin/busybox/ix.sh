{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox/ix(purec=musl/unwrap,libc=musl/pure)
{% endblock %}
