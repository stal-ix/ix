{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/vulkan/drivers
lib/angle/driver/lib
lib/angle/driver/egl
lib/angle/driver/glesv2
lib/angle/driver/glesv2/extra
# {{vulkan | defined('vulkan')}}
{% endblock %}
