{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if vulkan %}
bin/llama/cpp/vulkan
{% else %}
bin/llama/cpp/soft
{% endif %}
{% endblock %}
