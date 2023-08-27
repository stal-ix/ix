{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.91.tar.gz
sha:79b15eb508601018f2ddaab74df2bdbde79ebdb992004bfd91a52886c9ecae55
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
