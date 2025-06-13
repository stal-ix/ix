{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
liblxqt
{% endblock %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/liblxqt/archive/refs/tags/{{self.version().strip()}}.tar.gz
5994024d06aba5d33e72b578d3c36d56942f43218ecceac6ff172e6499511066
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
