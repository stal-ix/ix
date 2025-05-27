{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/desktop-app/tg_owt
{% endblock %}

{% block git_commit %}
48c9c31d591509799a8385542ff3fb04f4d58327
{% endblock %}

{% block git_sha %}
580779537a63d8f04d441539841c68a7ea9114f774d427809175b0a8671e0fc4
{% endblock %}

{% block lib_deps %}
lib/c
lib/vpx
lib/yuv
lib/jpeg
lib/opus
lib/crc32c
lib/ffmpeg
lib/openssl
lib/usrsctp
lib/openh264
lib/abseil/cpp
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/devendor
{% endblock %}

{% block cmake_flags %}
TG_OWT_USE_X11=OFF
TG_OWT_USE_PIPEWIRE=OFF
{% endblock %}

{% block patch %}
sed -e 's|.*WEBRTC_USE_X11.*||' -i cmake/libwebrtcbuild.cmake
sed -e 's|.*modules/desktop_capture/linux/.*||' \
    -e 's|.*modules/video_capture/linux/.*||' \
    -e 's|.*link_x11.*||' \
    -i CMakeLists.txt

>src/modules/desktop_capture/screen_drawer_linux.cc

base64 -d << EOF > src/modules/video_capture/video_capture_factory.cc
{% include 'video_capture_factory.cc/base64' %}
EOF

sed -e 's|.*\.h.*||' \
    -i cmake/libyuv.cmake

sed -e 's|.*\.h.*||' \
    -e 's|configure_file(|message(INFO|' \
    -i cmake/libcrc32c.cmake

devendor src/third_party/libyuv
devendor src/third_party/abseil-cpp
devendor src/third_party/crc32c

find . -type f | while read l; do
    sed -e 's|third_party/libyuv/include/libyuv|libyuv|' \
        -e 's|third_party/crc32c/src/include/crc32c|crc32c|' \
        -i ${l}
done

sed -e 's|ABSL_ATTRIBUTE_LIFETIME_BOUND||' \
    -i src/api/candidate.h
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*INTERFACE.*include/tg_owt/third_party.*||' \
    -i ${out}/lib/cmake/tg_owt/tg_owtTargets.cmake
{% endblock %}
