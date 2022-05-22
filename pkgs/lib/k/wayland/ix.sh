{% extends '//die/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.94/kwayland-5.94.0.tar.xz
sha:b2a4d8e1b4d81ce798c991cfb34210ba095f6406a37f4714ae3ab64abaca2636
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
