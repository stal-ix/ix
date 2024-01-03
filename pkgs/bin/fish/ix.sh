{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.7.0.tar.gz
sha:2dbb6319408016b86c9190271bc1f11fd6384993b4305223235815708a0f8b23
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
