{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/FreeGLUTProject/freeglut/releases/download/v3.2.2/freeglut-3.2.2.tar.gz
sha:c5944a082df0bba96b5756dddb1f75d0cd72ce27b5395c6c1dde85c2ff297a50
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/wayland
lib/xkbcommon
{% endblock %}

{% block cmake_flags %}
FREEGLUT_GLES=ON
FREEGLUT_WAYLAND=ON
FREEGLUT_BUILD_SHARED_LIBS=OFF
{% endblock %}
