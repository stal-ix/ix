{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/yambar/archive/1.9.0.tar.gz
sha:46f3002338f451c154678167bf3d5f593307954b6f381c50ddef2726b1a8c811
{% endblock %}

{% block bld_libs %}
lib/c
lib/alsa
lib/yaml
lib/udev
lib/kernel
lib/tllist
lib/fcft/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/flex
bin/scdoc
bld/bison
bld/wayland
{% endblock %}

{% block meson_flags %}
backend-x11=disabled
backend-wayland=enabled
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF

sed -e 's|.*export_dyn.*||' -i meson.build
sed -e 's|#error|#warning|' -i char32.c
{% endblock %}
