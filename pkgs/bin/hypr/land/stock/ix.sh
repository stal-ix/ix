{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/uuid
lib/pango
lib/cairo
lib/input
lib/opengl
lib/wayland
lib/shim/x11
lib/hypr/lang
lib/xkb/common
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/aqua/marine
lib/hypr/cursor
lib/build/muldefs
lib/toml/plus/plus
lib/mesa/glesv2/dl
{% endblock %}

{% block meson_tool %}
bld/meson/4
{% endblock %}

{% block bld_tool %}
bin/jq
bld/wayland
bld/fakegit
bin/hypr/wayland/scanner
{% endblock %}

{% block patch %}
sed -e 's|) {|) const {|' -i src/helpers/WLClasses.hpp

base64 -d << EOF > src/debug/CrashReporter.cpp
{% include 'CrashReporter.cpp/base64' %}
EOF

cat << EOF > scripts/generateVersion.sh
#!/usr/bin/env sh
EOF
chmod +x scripts/generateVersion.sh

sed -e 's|wayland-server|wayland-scanner|' -i protocols/meson.build
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
