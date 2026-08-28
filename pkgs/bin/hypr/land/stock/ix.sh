{% extends '//die/c/meson.sh' %}

{% block version %}
0.49.0
{% endblock %}

{% block pkg_name %}
Hyprland
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v{{self.version().strip()}}/source-v{{self.version().strip()}}.tar.gz
fd96fb043cfeda09a1ab9a5eb69fee55562475c0c6a41f79dad2bcc652dc5730
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
bld/wrap/cc/plugins/rdynamic/fake
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

sed -i 's/return m_timeline;/return !!m_timeline;/' \
    src/protocols/DRMSyncobj.hpp
sed -i 's/(uintptr_t)POPUP/(uintptr_t)POPUP.get()/' \
    src/desktop/Popup.cpp
sed -i 's/bool        isGroup               = m_groupData.pNextWindow;/bool        isGroup               = !!m_groupData.pNextWindow;/' \
    src/desktop/Window.cpp
sed -i 's/return m_resource;/return !!m_resource;/' \
    src/desktop/WLSurface.cpp
sed -i '/CHLBufferReference::operator bool/,/^}/s/return m_buffer;/return !!m_buffer;/' \
    src/protocols/types/Buffer.cpp
sed -e 's/(uintptr_t)dragSurface, (uintptr_t)origin/(uintptr_t)dragSurface.get(), (uintptr_t)origin.get()/' \
    -e 's/m_dnd.dndSurface->m_current.texture <= 0/!m_dnd.dndSurface->m_current.texture/' \
    -e 's/return m_dnd.currentSource;/return !!m_dnd.currentSource;/' \
    -i src/protocols/core/DataDevice.cpp
sed -i 's/bool attachedBuffer = m_surface->m_current.texture;/bool attachedBuffer = !!m_surface->m_current.texture;/' \
    src/protocols/LayerShell.cpp
sed -i 's/m_fakeFrame = fb;/m_fakeFrame = !!fb;/' \
    src/render/OpenGL.cpp
sed -i 's/m_cursorHasSurface = surf;/m_cursorHasSurface = !!surf;/' \
    src/render/Renderer.cpp
sed -i 's/bool connected = m_listeners.destroySurface;/bool connected = !!m_listeners.destroySurface;/' \
    src/xwayland/XSurface.cpp
sed -i 's/const bool ISWINDOWGROUP       = PWINDOW->m_groupData.pNextWindow;/const bool ISWINDOWGROUP       = !!PWINDOW->m_groupData.pNextWindow;/' \
    src/managers/KeybindManager.cpp
sed -i 's/(uintptr_t)m_surface/(uintptr_t)m_surface.get()/g' \
    src/protocols/ColorManagement.cpp \
    src/protocols/XXColorManagement.cpp \
    src/protocols/FrogColorManagement.cpp
sed -i 's@std::find(m_parent->m_subsurfaces.begin(), m_parent->m_subsurfaces.end(), SURF)@std::find_if(m_parent->m_subsurfaces.begin(), m_parent->m_subsurfaces.end(), [SURF](const auto\& s) { return s->m_surface == SURF; })@' \
    src/protocols/core/Subcompositor.cpp
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
