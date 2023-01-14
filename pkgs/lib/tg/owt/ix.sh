{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/desktop-app/tg_owt/archive/1eab2d736a2fecce01686689b72e39ad8c314ebb.zip
sha:c241fc27dce6900268c445ce1d2bec58eef15c06598825c27270cce494dd396b
{% endblock %}

{% block lib_deps %}
lib/c
lib/vpx
lib/yuv
lib/jpeg
lib/opus
lib/crc32c
lib/openssl
lib/usrsctp
lib/ffmpeg/4
lib/openh264
lib/abseil/cpp
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/yasm
{% endblock %}

{% block cmake_flags %}
TG_OWT_USE_X11=OFF
#TG_OWT_PACKAGED_BUILD=0
TG_OWT_USE_PIPEWIRE=OFF
{% endblock %}

{% block patch %}
sed -e 's|.*WEBRTC_USE_X11.*||' -i cmake/libwebrtcbuild.cmake
sed -e 's|.*modules/desktop_capture/linux/.*||' -e 's|.*link_x11.*||' -i CMakeLists.txt

>src/modules/desktop_capture/screen_drawer_linux.cc
>src/third_party/libyuv/empty.cpp

cat << EOF > cmake/libyuv.cmake
add_library(libyuv OBJECT EXCLUDE_FROM_ALL)
init_target(libyuv)
add_library(tg_owt::libyuv ALIAS libyuv)
set(libyuv_loc \${third_party_loc}/libyuv)
nice_target_sources(libyuv \${libyuv_loc}
PRIVATE
empty.cpp
)
EOF

cat << EOF > cmake/libabsl.cmake
add_library(libabsl OBJECT EXCLUDE_FROM_ALL)
init_target(libabsl)
add_library(tg_owt::libabsl ALIAS libabsl)
set(libabsl_loc \${third_party_loc}/libyuv)
nice_target_sources(libabsl \${libabsl_loc}
PRIVATE
empty.cpp
)
EOF

cat << EOF > cmake/libcrc32c.cmake
add_library(libcrc32c OBJECT EXCLUDE_FROM_ALL)
init_target(libcrc32c)
add_library(tg_owt::libcrc32c ALIAS libcrc32c)
set(libcrc32c_loc \${third_party_loc}/libyuv)
nice_target_sources(libcrc32c \${libcrc32c_loc}
PRIVATE
empty.cpp
)
EOF

find . -type f | while read l; do
    sed -e 's|third_party/libyuv/include/libyuv|libyuv|' \
        -e 's|third_party/crc32c/src/include/crc32c|crc32c|' \
        -i ${l}
done
{% endblock %}
