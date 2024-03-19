{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.7.1.tar.gz
sha:a3ea79c8affb9fa3c510ec6f12b9a8d176fec2d532ea7c41dfd4da4205272f19
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/intl
lib/curses
lib/pcre/2
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
