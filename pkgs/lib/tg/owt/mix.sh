{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/desktop-app/tg_owt/archive/63a934db1ed212ebf8aaaa20f0010dd7b0d7b396.zip
sha:1e560f4a51b62b80e1f475a9591963f42700839539272d80fdce277d8802c52b
{% endblock %}

{% block lib_deps %}
lib/c
lib/vpx
lib/yuv
lib/jpeg
lib/opus
lib/openssl
lib/ffmpeg/4
lib/abseil/cpp
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bin/yasm
{% endblock %}

{% block cmake_flags %}
TG_OWT_USE_PIPEWIRE=OFF
{% endblock %}

{% block patch %}
sed -e 's|.*WEBRTC_USE_X11.*||' -i cmake/libwebrtcbuild.cmake
sed -e 's|.*modules.*capture.*linux.*||' -e 's|.*link_x11.*||' -i CMakeLists.txt

echo > src/third_party/libyuv/empty.cpp

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

find . -type f | while read l; do
    sed -e 's|third_party/libyuv/include/libyuv|libyuv|' -i ${l}
done
{% endblock %}
