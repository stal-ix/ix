{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
liblxqt
{% endblock %}

{% block version %}
2.5.1
{% endblock %}

{% block fetch %}
https://github.com/lxqt/liblxqt/archive/refs/tags/{{self.version().strip()}}.tar.gz
00541371cd5a98ae7aeab23b39296d17425aad0527806e2ef8775fd434cb2384
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
