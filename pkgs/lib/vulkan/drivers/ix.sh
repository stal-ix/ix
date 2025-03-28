{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if swift_shader %}
lib/swift/shader/driver
{% elif amd_vlk %}
lib/amd/vlk/driver
{% elif mesa_driver %}
lib/mesa/drivers
{% endif %}
lib/vulkan/loader/dl
{% endblock %}
