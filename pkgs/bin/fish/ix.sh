{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.6.3.tar.gz
sha:5fdbfdd74d228df17651b9be6a805baaf9f8f6e9e670b77c57288e1bfb65ed51
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
