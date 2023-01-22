{% extends '//die/hub.sh' %}

{% block run_deps %}
set/ci/unwrap/linux/x86_64(target=linux-x86_64)
set/ci/unwrap/linux/aarch64(target=linux-aarch64)
{% endblock %}
