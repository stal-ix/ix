{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/telegramdesktop/tdesktop/releases/download/v3.7.1/tdesktop-3.7.1-full.tar.gz
sha:9d02a5a4c2ac405abb6146d14b3a8d2d303715e43b4a3425a7976b0325f41720
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lz4
lib/c++
lib/vpx
lib/alsa
lib/opus
lib/gsl/ms
lib/xxhash
lib/openal
lib/tg/owt
lib/openssl
lib/minizip
lib/range/v3
lib/ffmpeg/4
lib/qt/6/svg
lib/expected
lib/qt/6/base
lib/qt/6/compat
lib/qt/6/wayland
lib/xiph/rnnoise
{% endblock %}

{% block cmake_flags %}
LIBTGVOIP_DISABLE_ALSA=ON
LIBTGVOIP_DISABLE_PULSEAUDIO=ON

DESKTOP_APP_DISABLE_CRASH_REPORTS=ON
DESKTOP_APP_DISABLE_JEMALLOC=ON
DESKTOP_APP_USE_PACKAGED=ON

DESKTOP_APP_DISABLE_DBUS_INTEGRATION=ON
DESKTOP_APP_DISABLE_SPELLCHECK=ON
DESKTOP_APP_DISABLE_X11_INTEGRATION=ON

TDESKTOP_API_ID=17349
TDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb
TDESKTOP_LAUNCHER_BASENAME=telegram-desktop
{% endblock %}

{% block bld_tool %}
bld/python
bin/wayland/protocols
{% endblock %}
