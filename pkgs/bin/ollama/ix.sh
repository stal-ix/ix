{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if vulkan %}
bin/ollama/vulkan
{% else %}
bin/ollama/soft
{% endif %}
{% endblock %}
