{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include '//bin/kernel/18/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
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
bin/ld(for_target={{target.gnu.three}})
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

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/tmp/|/var/tmp/|g' -i ${l}
done
{% endblock %}
