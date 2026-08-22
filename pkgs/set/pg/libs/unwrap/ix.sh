{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/c/dl
lib/ev
lib/c++
lib/jxl
lib/drm
lib/png
lib/mnl
lib/glfw
lib/dbus
lib/seat
lib/udev
lib/input
lib/sndio
lib/uring
lib/curses
lib/kernel
lib/aws/lc
lib/c/ares
lib/xxhash
lib/lcms/2
lib/wayland
lib/lunasvg
lib/freetype
lib/utf8/proc
lib/xkb/common
lib/display/info
lib/vulkan/loader
lib/vulkan/headers
lib/wayland/protocols
lib/shim/fake(lib_name=gcc_s)
{% endblock %}
