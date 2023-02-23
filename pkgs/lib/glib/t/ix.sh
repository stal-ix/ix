{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glib/2.75/glib-2.75.3.tar.xz
sha:7c517d0aff456c35a039bce8a8df7a08ce95a8285b09d1849f8865f633f7f871
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
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
