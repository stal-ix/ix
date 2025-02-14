{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if swift_shader %}
lib/swift/shader/driver
{% elif mesa_driver %}
lib/mesa/drivers
{% endif %}
lib/vulkan/loader/dl
{% endblock %}
