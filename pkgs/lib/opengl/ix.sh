{% extends '//die/hub.sh' %}

{% block lib_deps %}
  {% if linux or freebsd %}
    lib/opengl/loader
  {% elif darwin %}
    lib/darwin/framework/Carbon
    lib/darwin/framework/OpenGL
  {% endif %}
{% endblock %}
