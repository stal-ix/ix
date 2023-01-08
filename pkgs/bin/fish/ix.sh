{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.6.0.tar.gz
sha:3dd4f34ef8fd196b208e022119d0dcd543060c87766109300087676f33788d95
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
