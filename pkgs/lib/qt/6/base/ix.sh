{% extends '//lib/qt/6/base/t/ix.sh' %}

{% block lib_deps %}
lib/b2
lib/png
lib/icu
lib/dbus
lib/jpeg
lib/udev
lib/input
lib/opengl
lib/brotli
lib/pcre/2
lib/wayland
lib/openssl
lib/sqlite/3
lib/freetype
lib/harfbuzz
lib/xkbcommon
lib/fontconfig
lib/vulkan/loader
lib/vulkan/headers
lib/double/conversion
{{super()}}
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_androiddeployqt=OFF
QT_FEATURE_journald=OFF
QT_FEATURE_vulkan=ON
QT_FEATURE_system_sqlite=ON
QT_FEATURE_dbus_linked=ON
QT_FEATURE_openssl_linked=ON
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
sed -e 's|GLIB2::GLIB2|c|' -i cmake/Qt6Gui/Qt6GuiTargets.cmake
sed -e 's|GLIB2::GLIB2|c|' -i cmake/Qt6Core/Qt6CoreTargets.cmake
llvm-ar q libqtregister.a $(find -type f -name '*.o')
{% endblock %}

{% block env %}
export CMFLAGS="-DQT_DISABLE_NO_DEFAULT_PATH_IN_QT_PACKAGES=ON \${CMFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"Sans Serif"|"system-ui"|' -i src/gui/platform/unix/qgenericunixthemes.cpp
{% endblock %}
