{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/archive/refs/tags/v0.19.2beta.tar.gz
sha:4454220b67699b79825ae45efdded68856343a005e3f5c08a258ef918e7e10b1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pango
lib/cairo
lib/input
lib/opengl
lib/wayland
lib/shim/x11
lib/xkbcommon
lib/drivers/3d
lib/wlroots/17
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/range/v3/std
lib/mesa/glesv2/dl
{% endblock %}

{% block bld_tool %}
bld/python
bld/fakegit
bld/wayland
bin/hypr/land/protocols
{% endblock %}

{% block patch %}
rm -r subprojects

sed -e "s|subproject.*wlroots.*|dependency('wlroots')|" \
    -e 's|have_xwlr = .*|have_xwlr = false|' \
    -i meson.build

sed -e 's|.get_variable.*wlroots.*|,|' \
    -i src/meson.build

cat << EOF > patch.py
import sys

def it():
    for x in sys.stdin.read().split('\n'):
        if 'bool operator==(' in x:
            x = x.replace(') {', ') const {')
        yield x

print('\n'.join(it()).strip() + '\n')
EOF

find . -type f -name '*.hpp' | while read l; do
    cat ${l} | python3 patch.py > _
    mv _ ${l}
done

cat - src/helpers/MiscFunctions.cpp << EOF > _
#include <sstream>
EOF

mv _ src/helpers/MiscFunctions.cpp

cat - src/debug/HyprCtl.cpp << EOF > _
#include <sstream>
EOF

mv _ src/debug/HyprCtl.cpp

cat - src/helpers/BezierCurve.cpp << EOF > _
#include <algorithm>
EOF

mv _ src/helpers/BezierCurve.cpp

sed -e 's|NULL, XCB_STACK_MODE_ABOVE|0, XCB_STACK_MODE_ABOVE|' \
    -i src/managers/XWaylandManager.cpp

sed -e 's|.*Running on WAYLAND_DISPLAY.*||' -i src/Compositor.cpp
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
