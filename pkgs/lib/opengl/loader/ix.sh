{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/gbm
lib/opengl/headers
lib/opengl/loader/gl
lib/opengl/loader/egl
lib/opengl/loader/glesv2
lib/shim/fake/pkg(pkg_name=egl,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=glesv2,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=opengl,pkg_ver=100500)
{% endblock %}
