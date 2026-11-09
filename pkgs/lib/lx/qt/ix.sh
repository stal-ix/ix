{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
liblxqt
{% endblock %}

{% block version %}
2.5.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/liblxqt/archive/refs/tags/{{self.version().strip()}}.tar.gz
c3c31b2b282057bd7d02ab1b69e634296334906759f30a80645d50b3b89eeeb3
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
