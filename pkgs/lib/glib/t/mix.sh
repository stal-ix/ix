{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib/-/archive/2.71.2/glib-2.71.2.tar.bz2
sha:325c76666ce1639453cdc8b2cc65217c550523f41158b77395825ce986f72e45
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
lib/pcre
lib/iconv
{% if darwin %}
lib/darwin/framework/CoreServices
lib/darwin/framework/Foundation
{% endif %}
{% endblock %}

{% block std_box %}
{% if darwin %}
bin/cctools
{% endif %}
bin/meson
bld/bootbox
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_includes %}
${PWD}/inc
{% endblock %}

{% block setup %}
export OBJC=clang
{% endblock %}

{% block meson_flags %}
iconv=external
tests=false
{% endblock %}
