{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FreeRDP/FreeRDP/archive/refs/tags/3.14.1.tar.gz
sha:8f4de354f51b5b957032446608bcc337a96f4c69928ba0c3b607a01417d694d9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/icu
lib/usb
lib/png
lib/sdl
lib/faac
lib/alsa
lib/faad2
lib/cairo
lib/ffmpeg
lib/kernel
lib/fuse/3
lib/c/json
lib/openssl
lib/sdl/ttf
lib/uriparser
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block cmake_flags %}
WITH_X11=OFF
WITH_FAAC=ON
WITH_CUPS=OFF
WITH_KRB5=OFF
WITH_FAAD2=ON
WITH_CAIRO=ON
WITH_SAMPLE=ON
WITH_SHADOW=OFF
WITH_PKCS11=OFF
WITH_WEBVIEW=OFF
# SDL ok
WITH_WAYLAND=OFF
WITH_LIBSYSTEMD=OFF
BUILTIN_CHANNELS=ON
CMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
{% endblock %}

{% block patch %}
sed -e 's|.*add_sub.*man.*||' -i client/SDL/SDL2/CMakeLists.txt
{% endblock %}
