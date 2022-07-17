{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/vulkan/loader/dl
lib/mesa/drivers/{{mesa_driver or 'radv'}}
{% endblock %}
