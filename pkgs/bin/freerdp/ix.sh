{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FreeRDP/FreeRDP/archive/refs/tags/3.10.0.tar.gz
sha:fb776f1f7ef401f8ceb54eb9fce5457c1e2ac04230d62fbc31dc25d9bdca0b1a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/icu
lib/usb
lib/png
lib/faac
lib/alsa
lib/sdl/2
lib/faad2
lib/cairo
lib/ffmpeg
lib/kernel
lib/fuse/3
lib/c/json
lib/openssl
lib/sdl/2/ttf
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
{% endblock %}

{% block patch %}
sed -e 's|.*add_sub.*man.*||' -i client/SDL/SDL2/CMakeLists.txt
{% endblock %}
