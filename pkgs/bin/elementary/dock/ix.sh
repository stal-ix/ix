{% extends '//die/vala/meson.sh' %}

{% block version %}
8.0.0
{% endblock %}

{% block fetch %}
https://github.com/elementary/dock/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:9aac9b6e5774adf5bd95605173b2d120036ee5605f28f8e12bc6d4a9bc9e78b8
{% endblock %}

{% block bld_libs %}
lib/c
lib/gee
lib/gtk/4
lib/adwaita
lib/granite/4
lib/shim/fake/pkg(pkg_name=gtk4-x11,pkg_ver=100500)
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/wayland
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/adwaita/vapi
lib/granite/4/gir
{% endblock %}

{% block patch %}
base64 -d << EOF > src/MainWindow.vala
{% include 'MainWindow.vala/base64' %}
EOF
{% endblock %}
