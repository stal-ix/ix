{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.86.tar.gz
sha:1478cb124c6cbe4633e2d2b593fa4451f0d3f6b7ef37e2baf2045cf1f3d5a7b0
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/md
lib/bsd
lib/event
lib/curses
lib/openssl
lib/linux/util
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block patch %}
>compat/reallocarray.c
>compat/getprogname.c
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_missing %}
bsd/stdlib.h
bsd/unistd.h
bsd/stdio.h
{% endblock %}
