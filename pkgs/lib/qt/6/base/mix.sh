{% extends '//mix/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtbase/archive/refs/tags/v6.3.0.tar.gz
sha:c50dc73f633e6c0f6ee3f51980c698800f1a0cadb423679bcef18e446ac72138
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/png
lib/icu
lib/dbus
lib/jpeg
lib/udev
lib/input
lib/opengl
lib/brotli
lib/sqlite3
lib/wayland
lib/openssl
lib/freetype
lib/harfbuzz
lib/xkbcommon
lib/fontconfig
lib/vulkan/loader
lib/vulkan/headers
lib/double/conversion
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block cmake_flags %}
QT_FEATURE_journald=OFF
QT_FEATURE_vulkan=ON
QT_FEATURE_reduce_relocations=OFF
QT_FEATURE_static_runtime=ON
QT_FEATURE_shared=OFF
QT_FEATURE_static=ON
QT_FEATURE_system_sqlite=ON
QT_FEATURE_dbus_linked=ON
QT_FEATURE_openssl_linked=ON
{% endblock %}
