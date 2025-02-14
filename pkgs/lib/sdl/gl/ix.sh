{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/opengl
{% else %}
lib/shim/fake(lib_name=EGL)
lib/shim/fake/pkg(pkg_name=egl,pkg_ver=100500)
{% endif %}
{% endblock %}
