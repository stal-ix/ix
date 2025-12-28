{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glib
{% endblock %}

{% block version %}
2.86.3
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/glib/{{self.version()[:4]}}/glib-{{self.version().strip()}}.tar.xz
b3211d8d34b9df5dca05787ef0ad5d7ca75dec998b970e1aab0001d229977c65
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
lib/intl
lib/iconv
lib/pcre/2
{% if darwin %}
lib/shim/dll(dll_name=resolv)
lib/darwin/framework/AppKit
lib/darwin/framework/CoreServices
lib/darwin/framework/Foundation
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/meson/1/4
{% if darwin %}
bld/cctools
{% endif %}
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_includes %}
${PWD}/inc
{% endblock %}

{% block patch %}
sed -e 's|.*static_assert.*||'   \
    -e 's|.*G_STATIC_ASSERT.*||' \
    -i gio/gio-launch-desktop.c
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
