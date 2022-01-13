{% extends '//lib/vulkan/loader/t/mix.sh' %}

{% block env %}
export VULKAN_LOADER_DATA="${out}"
{% endblock %}
