{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glib/2.82/glib-2.82.4.tar.xz
sha:37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0cb6b8b2dff187c709
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
bld/meson/1
pip/packaging
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

{% block configure1 %}
{{super()}}
cat << EOF >> ${tmp}/obj/config.h
#undef HAVE_FREE_SIZED
#undef HAVE_FREE_ALIGNED_SIZED
EOF
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
