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
lib/bfd
lib/ctf
lib/glib
lib/zstd
lib/numa
lib/slang
lib/linux
lib/iberty
lib/curses
lib/opcodes
lib/openssl
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
WERROR=0
NO_JVMTI=1
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
