{% extends '//die/c/cmake.sh' %}

{% block bld_tool %}
bld/glib
bld/perl
bld/ruby
bin/gperf
bld/python
bld/gettext
bld/wayland
bin/xmllint
bld/pkg/config
{% endblock %}

{% block task_pool %}full{% endblock %}

{% block cmake_flags %}
USE_AVIF=ON
USE_SYSTEMD=OFF
USE_LIBHYPHEN=OFF

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
{% endblock %}

{% block c_rename_symbol %}
_caches
_xdg_binary_or_text_fallback
{% endblock %}

{% block cpp_defines %}
WL_EGL_PLATFORM=1
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS=$(echo ${CPPFLAGS} | tr ' ' '\n' | grep -v mesa | tr '\n' ' ')
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}

{% block patch %}
base64 -d << EOF > Source/WebKit/WebProcess/InjectedBundle/glib/InjectedBundleGlib.cpp
{% include 'InjectedBundleGlib.cpp/base64' %}
EOF

sed -e 's|ENABLE(DEVELOPER_MODE)|1|g' \
    -i Source/WebKit/Shared/glib/ProcessExecutablePathGLib.cpp

sed -e 's|.*find.*TOUCH.*||' -i Source/JavaScriptCore/CMakeLists.txt
{% endblock %}
