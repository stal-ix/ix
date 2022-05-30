{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib/-/archive/2.72.2/glib-2.72.2.tar.bz2
sha:2f9daad3e51b0f98a94703c3667830ffabe287d622c7b0af22dd543faeb73b8a
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
