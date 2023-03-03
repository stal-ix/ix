{% extends '//die/c/cmake.sh' %}

{% block task_pool %}full{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lz4
lib/c++
lib/vpx
lib/opus
lib/ffmpeg
lib/gsl/ms
lib/xxhash
lib/openal
lib/tg/owt
lib/tg/voip
lib/openssl
lib/protobuf
lib/mini/zip
lib/dispatch
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
lib/range/v3/std
lib/mesa/glesv2/dl
lib/k/imageformats
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

{% block cpp_defines %}
QT_STATICPLUGIN=1
{% endblock %}

{% block cmake_flags %}
DESKTOP_APP_DISABLE_CRASH_REPORTS=ON
DESKTOP_APP_DISABLE_JEMALLOC=ON
DESKTOP_APP_USE_PACKAGED=ON
DESKTOP_APP_USE_PACKAGED_RLOTTIE=ON
DESKTOP_APP_QT6=ON

DESKTOP_APP_DISABLE_DBUS_INTEGRATION=ON
DESKTOP_APP_DISABLE_SPELLCHECK=OFF
DESKTOP_APP_DISABLE_X11_INTEGRATION=ON

TDESKTOP_API_ID=17349
TDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb
TDESKTOP_LAUNCHER_BASENAME=telegram-desktop
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/python
bin/protoc
bld/wayland
bld/pkg/config
bld/qt/6/wayland
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|third_party/libyuv/include/||' -i "${l}"
done

sed -e 's|Q_OS_LINUX|SHIT|' -i Telegram/lib_base/base/platform/linux/base_info_linux.cpp

sed -e 's|webrtc::InitPipewireStubs()|true|' \
    -i Telegram/lib_webrtc/webrtc/webrtc_media_devices.cpp

>Telegram/lib_ui/ui/text/qtextitemint.cpp

cat << EOF >> Telegram/SourceFiles/stdafx.h
#if defined(__cplusplus)
#include "Telegram/lib_ui/ui/widgets/scroll_area.h"
#include "Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/scoped_ref_ptr.h"
#endif
EOF

sed -e 's|.*DESKTOP_APP_USE_PACKAGED.*||' \
    -e 's|.*Xcb.*||' \
    -e 's|.*Gtk3Theme.*||' \
    -e 's|.*NimfInput.*||' \
    -i cmake/external/qt/qt_static_plugins/qt_static_plugins.cpp
{% endblock %}

{% block c_rename_symbol %}
zwp_linux_dmabuf_v1_interface
zwp_linux_buffer_params_v1_interface
{% endblock %}
