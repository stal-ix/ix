{% extends '//die/cmake.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
https://github.com/telegramdesktop/tdesktop/archive/refs/tags/v4.0.1.tar.gz
sha:02779dce6e82708c0ebe5f4d07dc878f1c117998b2ca6b8d2f0eb614b623c03e
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/*full*
extract 1 ${src}/v*
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lz4
lib/c++
lib/vpx
lib/opus
lib/gsl/ms
lib/xxhash
lib/openal
lib/tg/owt
lib/tg/voip
lib/openssl
lib/mini/zip
lib/dispatch
lib/range/v3
lib/ffmpeg/4
lib/qt/6/svg
lib/expected
lib/qt/6/base
lib/tg/rlottie
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/qt/6/compat
lib/qt/6/wayland
lib/xiph/rnnoise
lib/mesa/glesv2/dl
lib/qt/6/imageformats
lib/{{allocator}}/trim(delay=3,bytes=30000000)
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_includes %}
${PWD}
${PWD}/Telegram/ThirdParty/libtgvoip
{% endblock %}

{% block cmake_flags %}
DESKTOP_APP_DISABLE_CRASH_REPORTS=ON
DESKTOP_APP_DISABLE_JEMALLOC=ON
DESKTOP_APP_USE_PACKAGED=ON
DESKTOP_APP_USE_PACKAGED_RLOTTIE=ON
DESKTOP_APP_QT6=ON

DESKTOP_APP_DISABLE_DBUS_INTEGRATION=ON
DESKTOP_APP_DISABLE_SPELLCHECK=ON
DESKTOP_APP_DISABLE_X11_INTEGRATION=ON

TDESKTOP_API_ID=17349
TDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb
TDESKTOP_LAUNCHER_BASENAME=telegram-desktop
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/python
bld/pkg/config
bin/wayland/protocols
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|third_party/libyuv/include/||' -i "${l}"
done

sed -e 's|Q_OS_LINUX|SHIT|' -i Telegram/lib_base/base/platform/linux/base_info_linux.cpp

cat - Telegram/SourceFiles/core/local_url_handlers.cpp << EOF > _
#include <Telegram/lib_ui/ui/widgets/scroll_area.h>
EOF

mv _ Telegram/SourceFiles/core/local_url_handlers.cpp

cat - Telegram/SourceFiles/settings/settings_main.cpp << EOF > _
#include <Telegram/lib_ui/ui/widgets/scroll_area.h>
EOF

mv _ Telegram/SourceFiles/settings/settings_main.cpp

sed -e 's|webrtc::InitPipewireStubs()|true|' \
    -i Telegram/lib_webrtc/webrtc/webrtc_media_devices.cpp

>Telegram/lib_ui/ui/text/qtextitemint.cpp

sed -e 's|.*DESKTOP_APP_USE_PACKAGED.*||' \
    -e 's|.*Xcb.*||' \
    -e 's|.*Gtk3Theme.*||' \
    -e 's|.*NimfInput.*||' \
    -i cmake/external/qt/qt_static_plugins/qt_static_plugins.cpp
{% endblock %}
