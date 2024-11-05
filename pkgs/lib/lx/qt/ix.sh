{% extends '//die/c/lxqt.sh' %}

{% block fetch %}
https://github.com/lxqt/liblxqt/archive/refs/tags/2.1.0.tar.gz
sha:549ce9547a70ac1947a59bfc41cd62d71851f2c06964ee6e77d3f6643413d2c0
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
