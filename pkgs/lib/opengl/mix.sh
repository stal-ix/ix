{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/mesa/gl
{% endif %}
{% if darwin %}
lib/darwin/framework/Carbon
{% endif %}
{% endblock %}
