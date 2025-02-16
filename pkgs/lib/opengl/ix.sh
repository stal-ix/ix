{% extends '//die/hub.sh' %}

{% block lib_deps %}
  {% if linux %}
    lib/mesa/gl
    lib/mesa/egl
  {% elif darwin %}
    lib/darwin/framework/Carbon
    lib/darwin/framework/OpenGL
  {% endif %}
{% endblock %}
