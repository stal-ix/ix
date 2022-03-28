{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/freeglut/freeglut/3.2.1/freeglut-3.2.1.tar.gz
cd5c670c1086358598a6d4a9d166949d
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

{% block cpp_defines %}
EGL_NO_X11=1
{% endblock %}
