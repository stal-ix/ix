{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.6.4.tar.gz
sha:ae51eb8cbe17479fc2e5bdc2ede93f41d4ce0d137626eacbb5cc7446ddafa9e3
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
