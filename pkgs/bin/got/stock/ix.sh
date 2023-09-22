{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.93.tar.gz
sha:c2572726bedfdc177d48482b2a23e5afba534a36918f8eeac24b48da37a920d1
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
