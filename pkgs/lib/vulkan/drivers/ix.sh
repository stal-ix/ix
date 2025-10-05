{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if vulkan %}
{% if 'mesa/' in vulkan %}
lib/mesa(mesa_driver={{vulkan | basename}},opengl=,vulkan=)
{% else %}
lib/{{vulkan}}/driver
{% endif %}
lib/vulkan/loader/dl
{% endif %}
{% endblock %}
