{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/glslang
lib/vulkan/loader
lib/vulkan/headers
lib/vulkan/utility
lib/vulkan/validation
lib/vulkan/spirv/tools
lib/vulkan/spirv/cross
lib/vulkan/spirv/headers
{% endblock %}
