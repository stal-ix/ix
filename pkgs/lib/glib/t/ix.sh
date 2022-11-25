{% extends '//die/c/meson.sh' %}

{% block fetch %}
#https://download.gnome.org/sources/glib/2.74/glib-2.74.1.tar.xz
#sha:0ab981618d1db47845e56417b0d7c123f81a3427b2b9c93f5a46ff5bbb964964
https://download.gnome.org/sources/glib/2.75/glib-2.75.0.tar.xz
sha:6dde8e55cc4a2c83d96797120b08bcffb5f645b2e212164ae22d63c40e0e6360
#https://gitlab.gnome.org/GNOME/glib/-/archive/2.74.2/glib-2.74.2.tar.bz2
#sha:65499f929ff126af355d122b0f59e7777392e13f7a63b591057506a2ac066760
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
lib/intl
lib/iconv
lib/pcre/2
{% if darwin %}
lib/darwin/framework/CoreServices
lib/darwin/framework/Foundation
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/meson
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
iconv=external
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
