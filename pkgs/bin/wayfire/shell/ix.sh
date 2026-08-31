{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wf-shell
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block git_repo %}
https://github.com/WayfireWM/wf-shell
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
46c0bab3b37aa7a1896eae63529efaa3f8acd5e12e44662bd4421c1dc61482ac
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/deps
lib/pam
lib/epoxy
lib/gbm
lib/openssl
lib/xkb/common
lib/json/yy
lib/gtk/4/mm
lib/wf/config
lib/dbus/menu
lib/gtk/layer/shell/4
{% endblock %}

{% block patch %}
sed -e "/^wayfire = dependency('wayfire')$/d" -i meson.build
sed -e "s|wayfire.get_pkgconfig_variable.*|'wayfire-shell-unstable-v2.xml',|" -i proto/meson.build
sed -e '/#include <pulse\/proplist.h>/d' -i src/panel/widgets/brightness/brightness.cpp
sed -e 's|switch (hide_animation)|switch (hide_animation.value())|' -i src/locker/timedrevealer.cpp
sed \
    -e "s|install_dir:'/etc/pam.d/'|install_dir: join_paths(get_option('prefix'), 'etc', 'pam.d')|" \
    -e "s|install_dir: '/etc/xdg/xdg-desktop-portal-wlr/'|install_dir: join_paths(get_option('prefix'), 'etc', 'xdg', 'xdg-desktop-portal-wlr')|" \
    -i data/meson.build
base64 -d << EOF > proto/wayfire-shell-unstable-v2.xml
{% include 'wayfire-shell-unstable-v2.xml/base64' %}
EOF
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
volume-widget=disabled
wayland-logout=false
{% endblock %}
