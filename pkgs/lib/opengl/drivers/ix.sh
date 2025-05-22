{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if opengl %}
{% if 'mesa' in opengl %}
lib/mesa(mesa_driver={{opengl | basename}},opengl=,vulkan=)
{% else %}
lib/{{opengl}}/driver
{% endif %}
{% endif %}
{% endblock %}
