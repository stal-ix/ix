{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/freeglut/freeglut/3.2.1/freeglut-3.2.1.tar.gz
cd5c670c1086358598a6d4a9d166949d
{% endblock %}

{% block lib_deps %}
lib/opengl/mix.sh
lib/wayland/mix.sh
lib/xkbcommon/mix.sh
{% endblock %}

{% block cmake_flags %}
-DFREEGLUT_GLES=ON
-DFREEGLUT_WAYLAND=ON
-DFREEGLUT_BUILD_DEMOS=OFF
-DFREEGLUT_BUILD_SHARED_LIBS=OFF
{% endblock %}

{% block setup %}
export CPPFLAGS="-DEGL_NO_X11=1 ${CPPFLAGS}"
{% endblock %}
