{% extends '//lib/jasper/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/glu
lib/opengl
lib/mesa/gl
lib/freeglut
lib/mesa/egl
lib/mesa/glesv2
{% endblock %}

{% block cmake_flags %}
{{super()}}
JAS_HAVE_OPENGL=ON
JAS_HAVE_GL_GLUT_H=ON
JAS_ENABLE_OPENGL=ON
{% endblock %}

{% block patch %}
sed -e 's|.*JAS_HAVE_OPENGL 0.*||' -i CMakeLists.txt
{{super()}}
{% endblock %}

{% block test %}
test -f ${out}/bin/jiv
{% endblock %}
