{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.5.1.tar.gz
sha:22b097975f2f920a97cbe6e2aae92d2d8f215ae0b4243d778ee3cabf8f2fa774
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
