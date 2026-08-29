{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
liblxqt
{% endblock %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/liblxqt/archive/refs/tags/{{self.version().strip()}}.tar.gz
8c93f717e222c63bbfbcff388c08d387604a778e361e5ddb8ae0da4e1ef308ac
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
