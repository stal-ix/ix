{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.34.3.tar.xz
de30c41fb57b2b024417669c22914752
{% endblock %}

{% block lib_deps %}
web/kit/libs(harfbuzz_icu=1)
{% endblock %}

{% block bld_tool %}
gnu/gettext
dev/tool/perl
dev/tool/ruby
dev/tool/gperf
dev/tool/python
lib/wayland/protocols
{% endblock %}

{% block cmake_flags %}
PORT=GTK
USE_GTK4=ON
USE_WPE_RENDERER=OFF
ENABLE_GAMEPAD=OFF
ENABLE_XSLT=OFF
USE_LIBSECRET=OFF
ENABLE_INTROSPECTION=OFF
ENABLE_SPELLCHECK=OFF
USE_LIBNOTIFY=OFF
USE_LIBHYPHEN=OFF
USE_OPENJPEG=OFF
USE_WOFF2=OFF
USE_AVIF=OFF
USE_SYSTEMD=OFF
ENABLE_THUNDER=OFF
ENABLE_BUBBLEWRAP_SANDBOX=OFF
ENABLE_VIDEO=OFF
ENABLE_WEB_AUDIO=OFF
ENABLE_X11_TARGET=OFF
USE_LIBEPOXY=ON
USE_ANGLE_EGL=OFF
USE_ANGLE_WEBGL=OFF
ENABLE_WEBGL=OFF
USE_ANGLE=OFF
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -DEGL_NO_X11=1 ${CPPFLAGS}"
{% endblock %}
