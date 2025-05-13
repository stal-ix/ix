{% extends '//die/c/meson.sh' %}

{% block version %}
0.49.0
{% endblock %}

{% block pkg_name %}
Hyprland
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v{{self.version().strip()}}/source-v{{self.version().strip()}}.tar.gz
sha:fd96fb043cfeda09a1ab9a5eb69fee55562475c0c6a41f79dad2bcc652dc5730
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/re2
lib/uuid
lib/glaze
lib/pango
lib/cairo
lib/input
lib/opengl
lib/wayland
lib/shim/x11
lib/hypr/lang
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
bld/fakegit
bin/hypr/wayland/scanner
{% endblock %}

{% block patch %}
base64 -d << EOF > src/debug/CrashReporter.cpp
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
{% endblock %}

{% block meson_flags %}
xwayland=disabled
systemd=disabled
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
