{% extends '//bin/ollama/soft/ix.sh' %}

{% block lib_deps %}
lib/vulkan/drivers
bin/ollama/vulkan/driver
{{super()}}
{% endblock %}

{% block cpp_defines %}
GGML_USE_VULKAN=1
{{super()}}
{% endblock %}
