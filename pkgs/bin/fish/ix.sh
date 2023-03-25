{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.6.1.tar.gz
sha:0cf5f88c6273a39928857fcbda4af07b0b31d2624c372c4513ddbf7a96691ba5
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
