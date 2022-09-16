{% extends '//die/c/meson.sh' %}

{% block fetch %}
#https://gitlab.gnome.org/GNOME/glib/-/archive/2.73.3/glib-2.73.3.tar.bz2
#sha:36bc72280e27f84e454499aa1e6c14d1f1b85bbab2c1803c2dd46fde1877c22f
https://download.gnome.org/sources/glib/2.73/glib-2.73.3.tar.xz
sha:df1a2b841667d6b48b2ef6969ebda4328243829f6e45866726f806f90f64eead
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
sed -e 's|.*static_assert.*||' -i gio/gio-launch-desktop.c
{% endblock %}

{% block meson_flags %}
iconv=external
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
