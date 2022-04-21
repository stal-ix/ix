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
#lib/range/v3
lib/ffmpeg/4
lib/qt/6/svg
lib/expected
lib/qt/6/base

lib/mesa/gl
lib/mesa/egl
lib/mesa/glesv2

lib/qt/6/compat
lib/qt/6/wayland
lib/xiph/rnnoise
{% endblock %}

{% block cmake_flags %}
#CMAKE_COMMAND=newcmake

#LIBTGVOIP_DISABLE_ALSA=ON
LIBTGVOIP_DISABLE_PULSEAUDIO=ON

DESKTOP_APP_DISABLE_CRASH_REPORTS=ON
DESKTOP_APP_DISABLE_JEMALLOC=ON
DESKTOP_APP_USE_PACKAGED=ON
DESKTOP_APP_QT6=ON

DESKTOP_APP_DISABLE_DBUS_INTEGRATION=ON
DESKTOP_APP_DISABLE_SPELLCHECK=ON
DESKTOP_APP_DISABLE_X11_INTEGRATION=ON

TDESKTOP_API_ID=17349
TDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb
TDESKTOP_LAUNCHER_BASENAME=telegram-desktop

QT_ADDITIONAL_PACKAGES_PREFIX_PATH=${CMAKE_PREFIX_PATH}
{% endblock %}

{% block bld_tool %}
bld/python
bld/pkg/config
bin/wayland/protocols
{% endblock %}

{% block setup_tools %}
C=$(which cmake)

export SIP=$(add_suffix ${MIX_T_DIR} include)
export SLP=$(add_suffix ${MIX_T_DIR} lib)
export SPP=$(add_suffix ${MIX_B_DIR} bin)

cat << EOF > newcmake
#!$(which python3)

import sys
import subprocess

if '--build' in sys.argv:
    subprocess.check_call(['${C}'] + sys.argv[1:])
else:
    args = [
        '-DCMAKE_COMMAND=${C}',
        '-DQT_ADDITIONAL_PACKAGES_PREFIX_PATH=${CMAKE_PREFIX_PATH}',
        '-DCMAKE_SYSTEM_INCLUDE_PATH=${SIP}',
        '-DCMAKE_SYSTEM_LIBRARY_PATH=${SLP}',
        '-DCMAKE_SYSTEM_PROGRAM_PATH=${SPP}'
    ]

    subprocess.check_call(['${C}'] + args + sys.argv[1:])
EOF

chmod +x newcmake
{% endblock %}

{% block patch %}
base64 -d << EOF > cmake/external/kwayland/CMakeLists.txt
{% include 'CMakeLists.txt/base64' %}
EOF

find . -type f | while read l; do
    sed -e 's|third_party/libyuv/include/||' -i "${l}"
done

sed -e 's|Q_OS_LINUX|SHIT|' -i Telegram/lib_base/base/platform/linux/base_info_linux.cpp
{% endblock %}
