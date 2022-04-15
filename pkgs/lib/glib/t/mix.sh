{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib/-/archive/2.72.1/glib-2.72.1.tar.bz2
sha:23b31b903edb2087a59909a7d8b83fd5a9eb8876adae5360ef4141c8f932ab1d
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
bin/cctools
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
