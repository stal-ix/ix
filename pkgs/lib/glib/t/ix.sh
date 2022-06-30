{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib/-/archive/2.72.3/glib-2.72.3.tar.bz2
sha:822c523ae8edab910dd9dfd6673e74f4408bd50f27a4dc2081dc3cb9464aebcf
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
lib/pcre
lib/intl
lib/iconv
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

{% block meson_flags %}
iconv=external
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
