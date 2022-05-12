{% extends '//lib/qt/6/base/t/mix.sh' %}

{% block lib_deps %}
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
{{super()}}
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{{super()}}
{% endblock %}

{% block c_rename_symbol %}
blake2s_init_param
blake2s_init
blake2s_init_key
blake2s_update
blake2s_final
blake2s
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
llvm-ar q libqtregister.a $(find -type f -name '*.o')
{% endblock %}

{% block env %}
export CMFLAGS="-DQT_DISABLE_NO_DEFAULT_PATH_IN_QT_PACKAGES=ON \${CMFLAGS}"
{% endblock %}
