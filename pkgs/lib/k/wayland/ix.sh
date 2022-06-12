{% extends '//die/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.95/kwayland-5.95.0.tar.xz
sha:2b8fa6f1cb0e5663cfdec98bb6ebcbe5ceec5e39f71ed0c8fbac5c7cd20c472d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/k/ecm
lib/k/pwp
lib/qt/6/base
lib/qt/6/wayland
{% endblock %}

{% block bld_tool %}
bld/qt/6
bin/wayland/protocols
{% endblock %}

{% block cmake_flags %}
BUILD_WITH_QT6=ON
EXCLUDE_DEPRECATED_BEFORE_AND_AT=5.91.0
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Qt6::Concurrent|Qt6::Gui|' -i ${out}/lib/cmake/KF5Wayland/KF5WaylandTargets.cmake
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/KF6/KWayland/KWayland/Client \${CPPFLAGS}"
{% endblock %}
