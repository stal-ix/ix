{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/busybox/bare(purec=musl/pure)
{% endblock %}
