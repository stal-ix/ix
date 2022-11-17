{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FreeRDP/FreeRDP/archive/refs/tags/2.9.0.tar.gz
sha:ab8de7e962bdc3c34956160de2de8ed28423d39a78452b7686b72c94b1953b27
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
