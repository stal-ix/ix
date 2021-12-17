{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/freeglut/freeglut/3.2.1/freeglut-3.2.1.tar.gz
cd5c670c1086358598a6d4a9d166949d
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/opengl/mix.sh
lib/wayland/mix.sh
lib/xkbcommon/mix.sh
{% endblock %}

{% block cmake_flags %}
FREEGLUT_GLES=ON
FREEGLUT_WAYLAND=ON
FREEGLUT_BUILD_DEMOS=OFF
FREEGLUT_BUILD_SHARED_LIBS=OFF
{% endblock %}

{% block setup %}
export CPPFLAGS="-DEGL_NO_X11=1 ${CPPFLAGS}"
{% endblock %}
