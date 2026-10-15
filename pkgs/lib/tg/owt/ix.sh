{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/desktop-app/tg_owt
{% endblock %}

{% block git_commit %}
48c9c31d591509799a8385542ff3fb04f4d58327
{% endblock %}

{% block git_sha %}
bf07e7f2549993ce6a88b139c43939f90e93a2bab6cfce1932e4218b2e3f18ba
{% endblock %}

{% block git_version %}
v4
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

sed -e '/av_frame->reordered_opaque = context->reordered_opaque;/d' \
    -e '/int64_t frame_timestamp_us =/d' \
    -e '/av_context_->reordered_opaque = frame_timestamp_us;/d' \
    -e '/We don.t expect reordering/d' \
    -e '/Decoded frame timestamp should match/d' \
    -e '/RTC_DCHECK_EQ(av_frame_->reordered_opaque, frame_timestamp_us);/d' \
    -i src/modules/video_coding/codecs/h264/h264_decoder_impl.cc
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*INTERFACE.*include/tg_owt/third_party.*||' \
    -i ${out}/lib/cmake/tg_owt/tg_owtTargets.cmake
{% endblock %}
