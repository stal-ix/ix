{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/glslang
lib/vulkan/loader
lib/vulkan/headers
lib/vulkan/utility
lib/vulkan/validation
lib/spirv/tools
lib/spirv/cross
lib/spirv/headers
{% endblock %}
