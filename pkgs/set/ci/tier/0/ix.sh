{% extends '//die/hub.sh' %}

{% block run_deps %}
set/ci/unwrap(slot=1,opengl=fake,vulkan=fake)
{% endblock %}
