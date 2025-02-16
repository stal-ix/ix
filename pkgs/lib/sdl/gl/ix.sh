{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/opengl
{% elif linux %}
lib/shim/fake(lib_name=EGL)
lib/shim/fake/pkg(pkg_name=egl,pkg_ver=100500)
{% else %}
lib/opengl
{% endif %}
{% endblock %}
