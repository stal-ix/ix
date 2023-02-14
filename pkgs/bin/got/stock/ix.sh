{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.83.tar.gz
sha:90d854e8e47d21434f2fbd83f749e1ab65f9be6556ed8526a67abf10e52f1bff
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

{% block cpp_missing %}
bsd/stdlib.h
bsd/unistd.h
bsd/stdio.h
{% endblock %}
