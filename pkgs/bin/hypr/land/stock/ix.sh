{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/re2
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
lib/hypr/graphics
lib/build/muldefs
lib/toml/plus/plus
lib/mesa/glesv2/dl
{% endblock %}

{% block meson_tool %}
bld/meson/4
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

sed -e 's|logOfs.native_handle.*|-1;|' \
    -i src/debug/Log.cpp
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

{% block cxx_flags %}
-std=c++23
-D_LIBCPP_STD_VER=23
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
