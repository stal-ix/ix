{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
{% if 1 %}
lib/mesa/gl
lib/mesa/egl
{% else %}
lib/kernel
lib/shim/egl
{% endif %}
{% endif %}
{% if darwin %}
lib/darwin/framework/Carbon
{% endif %}
{% endblock %}
