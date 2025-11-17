{% extends '//bin/llama/cpp/soft/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bin/glslc
{% endblock %}

{% block cmake_flags %}
GGML_VULKAN=ON
{{super()}}
{% endblock %}
