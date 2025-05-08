{% extends '//bin/vulkan/tools/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_VULKANINFO=OFF
{% endblock %}
