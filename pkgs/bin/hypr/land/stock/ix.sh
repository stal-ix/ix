{% extends '//die/c/cmake.sh' %}

{% block version %}
0.56.2
{% endblock %}

{% block pkg_name %}
Hyprland
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v{{self.version().strip()}}/source-v{{self.version().strip()}}.tar.gz
03ad3f5ef152ff44116ffd56fcf808486211ecabf4f0ba567108ee746ba5cd2e
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
