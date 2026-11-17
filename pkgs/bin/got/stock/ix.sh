{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
got-portable
{% endblock %}

{% block version %}
0.131
{% endblock %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-{{self.version().strip()}}.tar.gz
7c0cde4201feaa398d1e9bf8a8bb697bb39b2dfba05a317d9fae20f1b19b51f1
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/md
lib/bsd
lib/event(libopenssl_ver=fake)
lib/curses
lib/ressl
lib/linux/util
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block patch %}
>compat/reallocarray.c
>compat/getprogname.c
{% if x86_64 %}
{# lib/str (lib/c) has these in its one object #}
>compat/strnlen.c
>compat/strlcpy.c
>compat/strlcat.c
>compat/strsep.c
{% endif %}
sed -e 's|set_panel_userptr(view->panel, view)|set_panel_userptr(view->panel, (char *)view)|' \
    -e 's|view_above = panel_userptr(panel)|view_above = (const struct tog_view *)panel_userptr(panel)|' \
    -i tog/tog.c
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_missing %}
bsd/stdlib.h
bsd/unistd.h
bsd/stdio.h
{% endblock %}
