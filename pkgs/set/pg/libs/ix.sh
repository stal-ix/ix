{% extends '//die/hub.sh' %}

{% block run_deps %}
set/pg/libs/unwrap(kind=lib,stalix=1,vulkan=amd/radv)
{% endblock %}
