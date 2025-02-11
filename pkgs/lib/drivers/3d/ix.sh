{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/mesa/drivers
{% elif swift_shader %}
lib/swift/shader/driver
{% endif %}
lib/vulkan/loader/dl
{% endblock %}
