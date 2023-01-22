{% extends '//die/hub.sh' %}

{% block run_deps %}
set/ci/unwrap/linux/x86_64(target=linux-x86_64)
{% endblock %}
