{% extends '//die/c/lxqt.sh' %}

{% block fetch %}
https://github.com/lxqt/liblxqt/archive/refs/tags/2.0.0.tar.gz
sha:464090c3e3eba5204c59500b2585c4210b44f9438438864fcceb3d09669611a5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/xdg
lib/qt/6/base
lib/k/window/system
{% endblock %}

{% block cmake_flags %}
{{super()}}
BUILD_BACKLIGHT_LINUX_BACKEND=OFF
{% endblock %}

{% block patch %}
sed -e 's|.*X11.*||' -i CMakeLists.txt
>lxqtscreensaver.cpp
>lxqtsingleapplication.cpp
{% endblock %}
