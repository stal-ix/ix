{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.93/kwayland-5.93.0.tar.xz
sha:1648a273ad1c0c1895a0edff9a3e97eb151e1e3533362e0f01d72706ac0a7abe
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

{% block postinstall %}
sed -e 's|Qt6::Concurrent|Qt6::Gui|' -i ${out}/lib/cmake/KF5Wayland/KF5WaylandTargets.cmake
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/KF6/KWayland/KWayland/Client \${CPPFLAGS}"
{% endblock %}
