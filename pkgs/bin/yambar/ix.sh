{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/yambar/archive/1.8.0.tar.gz
sha:51127d20613666b9924deb9afd92c48d69815c5043d2996b3f0f6e9705fcabc8
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
bin/scdoc
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
