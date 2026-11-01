{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
got-portable
{% endblock %}

{% block version %}
0.130.1
{% endblock %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-{{self.version().strip()}}.tar.gz
43c5fba2f3791e3cef202803baa819fd29c53c4ba1f89f90582e06c6a443beb4
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
