{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/mesa/gl
lib/mesa/egl
{% endif %}
{% if darwin %}
lib/darwin/framework/Carbon
{% endif %}
{% endblock %}
