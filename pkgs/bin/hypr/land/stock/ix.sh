{% extends '//die/c/cmake.sh' %}

{% block version %}
0.57.0
{% endblock %}

{% block pkg_name %}
Hyprland
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v{{self.version().strip()}}/source-v{{self.version().strip()}}.tar.gz
82d006ba9264fe67266c7d583c16f1a6c64d51424dbdc472c3e9c9d5ddfcd559
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/re2
lib/uuid
lib/muparser
lib/glaze/7
lib/glslang
lib/ei
lib/lua/puc/5/5
lib/readline
lib/canberra
lib/sd/bus/c++/2
lib/jthread/polyfill
lib/pango
lib/cairo
lib/input
lib/opengl
lib/wayland
lib/shim/x11
lib/hypr/lang
lib/hypr/wire
lib/xkb/common
lib/drivers/3d
lib/aqua/marine
lib/hypr/cursor
lib/hypr/graphics
lib/build/muldefs
lib/toml/plus/plus
{% endblock %}

{% block bld_tool %}
bin/jq
bld/prepend
bld/wayland
bld/python/13
bin/hypr/wayland/scanner
bin/hypr/wayland/protocols
lib/hypr/wire
bld/wrap/cc/plugins/rdynamic/fake
{% endblock %}

{% block patch %}
base64 -d << EOF > src/debug/crash/CrashReporter.cpp
{% include 'CrashReporter.cpp/base64' %}
EOF

cat << EOF > scripts/generateVersion.sh
#!/usr/bin/env sh
EOF

chmod +x scripts/generateVersion.sh

prepend hyprpm/src/helpers/Sys.cpp << EOF
#include <sstream>
EOF

sed -i 's|request.subview(i, 2)|std::string_view{request}.substr(i, 2)|' \
    src/ipc/s1/S1.cpp

prepend src/ipc/s2/S2.cpp << EOF
#include <algorithm>
EOF

prepend src/keybinds/Bind.hpp << EOF
#include <span>
EOF
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block cmake_flags %}
NO_XWAYLAND=ON
NO_SYSTEMD=ON
CMAKE_DISABLE_PRECOMPILE_HEADERS=ON
CMAKE_CXX_SCAN_FOR_MODULES=OFF
Python3_EXECUTABLE=${NATIVE_PYTHON}
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
