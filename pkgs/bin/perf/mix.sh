{% extends '//mix/make.sh' %}

{% block fetch %}
{% include '//bin/kernel/17/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/c++
lib/cap
lib/glib
lib/zstd
lib/slang
lib/linux
lib/curses
lib/elfutils
lib/readline
{% endblock %}

{% block unpack %}
{{super()}}
cd tools/perf
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bash
bld/perl
bld/bison
bld/python
bin/binutils
{% endblock %}

{%block make_flags %}
-f Makefile.perf
perfexecdir=lib/{{uniq_id}}
NO_SDT=1
NO_LIBPERL=1
NO_LIBPYTHON=1
LDFLAGS=-static
WERROR=0
NO_JVMTI=1
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
