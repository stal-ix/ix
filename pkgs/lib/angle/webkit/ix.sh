{% extends '//die/c/cmake.sh' %}

{% block version %}
2.48.1
{% endblock %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-{{self.version().strip()}}.tar.xz
sha:98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/atk
lib/icu
lib/c++
lib/gtk
lib/png
lib/jxl
lib/avif
lib/webp
lib/glib
lib/jpeg
lib/xslt
lib/flite
lib/tasn1
lib/cairo
lib/pango
lib/epoxy
lib/woff2
lib/xml/2
lib/gcrypt
lib/secret
lib/soup/3
lib/lcms/2
lib/notify
lib/wayland
lib/seccomp
lib/sqlite/3
lib/freetype
lib/harfbuzz
lib/jpeg/open
lib/gstreamer
lib/fontconfig
lib/harfbuzz/icu
{% endblock %}

{% block bld_tool %}
bld/glib
bld/perl
bld/ruby
bin/gperf
bld/python
bin/unifdef
bld/gettext
bld/wayland
bin/xml/lint
bld/pkg/config
{% endblock %}

{% block task_pool %}full{% endblock %}

{% block cmake_flags %}
USE_ANGLE_EGL=ON

USE_AVIF=ON
USE_SYSTEMD=OFF
USE_LIBHYPHEN=OFF
USE_LIBBACKTRACE=OFF

ENABLE_THUNDER=OFF
ENABLE_GAMEPAD=OFF
ENABLE_SPELLCHECK=OFF
ENABLE_JOURNALD_LOG=OFF
ENABLE_INTROSPECTION=OFF
ENABLE_BUBBLEWRAP_SANDBOX=OFF

ENABLE_X11_TARGET=OFF
ENABLE_WAYLAND_TARGET=ON

ENABLE_WEBGL=ON

USE_SYSTEM_MALLOC=ON
USE_SYSTEM_MALLOC_DEFAULT=ON
ENABLE_JIT_DEFAULT=OFF
ENABLE_FTL_DEFAULT=OFF
ENABLE_JIT=OFF
ENABLE_FTL=OFF

TOUCH_EXECUTABLE=touch

PORT=GTK
USE_JPEGXL=ON
ENABLE_WEBDRIVER=OFF
USE_GSTREAMER_TRANSCODER=OFF
USE_SYSTEM_SYSPROF_CAPTURE=OFF
{% endblock %}

{% block cpp_defines %}
WL_EGL_PLATFORM=1
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block cxx_flags %}
-Wno-register
-Wno-missing-template-arg-list-after-template-kw
{% endblock %}

{% block ninja_build_targets %}
lib/libANGLE.a
lib/libGLESv2.a
lib/libEGL.a
{% endblock %}

{% block install %}
mkdir ${out}/lib
llvm-ar qL ${out}/lib/libangle.a ${tmp}/obj/lib/*.a
{% endblock %}

{% block env %}
export ANGLE_DIR=${out}/lib
{% endblock %}
