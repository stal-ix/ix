{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FreeRDP/FreeRDP/archive/refs/tags/2.10.0.tar.gz
sha:88fa59f8e8338d5cb2490d159480564562a5624f3a3572c89fa3070b9626835c
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/usb
lib/faac
lib/alsa
lib/faad2
lib/cairo
lib/ffmpeg
lib/kernel
lib/wayland
lib/openssl
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block cmake_flags %}
WITH_X11=OFF
WITH_FAAC=ON
WITH_FAAD2=ON
WITH_CAIRO=ON
WITH_SAMPLE=ON
WITH_WAYLAND=ON
WITH_LIBSYSTEMD=OFF
BUILTIN_CHANNELS=ON
{% endblock %}
