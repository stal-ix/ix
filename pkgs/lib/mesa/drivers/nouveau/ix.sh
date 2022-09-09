{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/valve(opengl=nouveau)
lib/mesa/drivers/opengl(driver=nouveau)
#lib/mesa/drivers/vulkan(driver=lvp)
{% endblock %}
