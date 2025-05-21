{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if not vulkan %}
{{error('no vulkan driver provided')}}
{% endif %}
lib/vulkan/drivers
lib/angle/driver/lib
lib/angle/driver/egl
lib/angle/driver/glesv2
lib/angle/driver/glesv2/extra
{% endblock %}
