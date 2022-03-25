{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib/-/archive/2.72.0/glib-2.72.0.tar.bz2
sha:634eae6383b7c39ece89070914a0e8e090245d69343eb46b92527aef3635e24a
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

{% block meson_flags %}
iconv=external
tests=false
{% endblock %}
