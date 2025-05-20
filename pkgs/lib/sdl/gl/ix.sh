{% extends '//die/hub.sh' %}

{% block lib_deps %}
  {% if mesa_driver or angle %}
    lib/opengl
    lib/sdl/gl/on
  {% else %}
    lib/sdl/gl/off
    lib/shim/fake(lib_name=EGL)
    lib/shim/fake/pkg(pkg_name=egl,pkg_ver=100500)
  {% endif %}
{% endblock %}
