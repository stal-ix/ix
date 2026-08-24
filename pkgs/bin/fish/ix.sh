{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fish-shell
{% endblock %}

{% block version %}
4.8.1
{% endblock %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/{{self.version().strip()}}.tar.gz
f62d5338bd9e767210e1c407680b8beb46ddb24086ac31958dec71df2f741f2a
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
