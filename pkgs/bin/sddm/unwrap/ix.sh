{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sddm/sddm/archive/refs/tags/v0.20.0.tar.gz
sha:467c8bd91e0d4f76d4bc4e57ab334f1f48a33478482ba9476d93b0b3d7ace9fb
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pam
lib/glib
lib/k/ecm
lib/wayland
lib/pam/unix
lib/shim/x11
lib/xkbcommon
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/declarative/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/wayland
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
UID_MIN=10000
UID_MAX=20000
LIBXCB_INCLUDE_DIR=/nowhere
LIBXAU_INCLUDE_DIRS=/nowhere
NO_SYSTEMD=ON
BUILD_WITH_QT6=ON
ENABLE_JOURNALD=OFF
CMAKE_INSTALL_SYSCONFDIR=${out}/etc
{% endblock %}

{% block patch %}
rm cmake/FindXCB.cmake
rm cmake/FindXKB.cmake
sed -e 's|.*XKB REQ.*||' -i CMakeLists.txt
sed -e 's|.*XCB REQ.*||' -i CMakeLists.txt
sed -e 's|.*XAU REQ.*||' -i CMakeLists.txt
>src/greeter/XcbKeyboardBackend.h
>src/greeter/XcbKeyboardBackend.cpp
sed -e 's|m_backend = new XcbKeyboardBackend.*|m_backend = nullptr;|' -i src/greeter/KeyboardModel.cpp
>services/CMakeLists.txt
{% endblock %}
