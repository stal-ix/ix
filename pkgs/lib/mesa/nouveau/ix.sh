{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/valve(opengl=nouveau)
lib/mesa/opengl(driver=nouveau)
#lib/mesa/vulkan(driver=lvp)
{% endblock %}
