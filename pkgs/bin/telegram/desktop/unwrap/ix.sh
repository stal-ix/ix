{% extends '//die/c/cmake.sh' %}

{% block task_pool %}full{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ada
lib/lz4
lib/c++
lib/vpx
lib/opus
lib/boost
lib/ffmpeg
lib/gsl/ms
lib/xxhash
lib/openal
lib/gi/cpp
lib/tg/owt
lib/tg/voip
lib/openssl
lib/protobuf
lib/mini/zip
lib/dispatch
lib/qt/6/svg
lib/expected
lib/qt/6/base
lib/qt/6/deps
lib/glib/mm/3
lib/tg/rlottie
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/qt/6/compat
lib/qt/6/wayland
lib/xiph/rnnoise
lib/gi/repository
lib/k/core/addons
lib/mesa/glesv2/dl
lib/k/image/formats
lib/qt/6/declarative
lib/qt/6/imageformats
lib/{{allocator}}/trim(delay=3,bytes=30000000)
{% endblock %}

{% block bld_data %}
lib/gi/repository/gir
lib/gi/files
{% endblock %}

{% block host_libs %}
lib/glib/dl
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

# https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
TDESKTOP_API_ID=611335
TDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c

TDESKTOP_LAUNCHER_BASENAME=telegram-desktop
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/glib
bld/python
bin/protoc
bld/gir/cpp
bld/wayland
bld/prepend
bld/pkg/config
bld/qt/6/tools
bld/qt/6/wayland
bld/qt/6/tools/qml
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|third_party/libyuv/include/||' -i "${l}"
done

sed -e 's|Q_OS_LINUX|SHIT|' -i Telegram/lib_base/base/platform/linux/base_info_linux.cpp

>Telegram/lib_ui/ui/text/qtextitemint.cpp

base64 -d << EOF > Telegram/lib_webrtc/webrtc/webrtc_create_adm.h
{% include 'webrtc_create_adm.h/base64' %}
EOF

base64 -d << EOF > cmake/external/glib/generate_cppgir.cmake
{% include 'generate_cppgir.cmake/base64' %}
EOF

sed -e 's|.*add_cppgir().*||' -i cmake/external/glib/CMakeLists.txt

sed -e 's|ranges::contains(cap|Contains(cap|' \
    -e 's|ranges::all_of(std::initializer_list|ranges::all_of(std::initializer_list<const char*>|' \
    -i Telegram/SourceFiles/platform/linux/notifications_manager_linux.cpp

prepend Telegram/SourceFiles/platform/linux/notifications_manager_linux.cpp << EOF
template <class T, class R>
inline bool Contains(const T& t, const R& r) {
    for (const auto& x : t) {
        if (x == r) {
            return true;
        }
    }

    return false;
}
EOF

sed -e 's|DESKTOP_APP_DISABLE_WAYLAND_INTEGRATION|TRUE|' -i Telegram/lib_webview/CMakeLists.txt

prepend Telegram/SourceFiles/info/info_content_widget.cpp << EOF
#include "Telegram/lib_ui/ui/effects/numbers_animation.h"
EOF

prepend Telegram/SourceFiles/info/media/info_media_list_widget.cpp << EOF
#include "Telegram/lib_ui/ui/effects/numbers_animation.h"
EOF

cd Telegram/ThirdParty/jemalloc

find . -type f -name '*.c' | while read l; do
    echo > ${l}
done

find . -type f -name '*.h' | while read l; do
    echo > ${l}
done
{% endblock %}

{% block c_rename_symbol %}
zwp_linux_dmabuf_v1_interface
zwp_linux_buffer_params_v1_interface
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-missing-template-arg-list-after-template-kw
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|cmake/external/cld3/protobuf$:$:protoc|'"$(which protoc)"'|g' \
    -e 's|protobuf::protoc|protoc|g' \
    -i ${tmp}/obj/build.ninja
{% endblock %}
