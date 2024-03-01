{% extends '//die/c/make.sh' %}

{% include '//bin/kernel/latest/ver.sh' %}

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
lib/kernel
lib/unwind
lib/iberty
lib/curses
lib/opcodes
lib/openssl
lib/elfutils
lib/readline
lib/trace/event
lib/trace/event/plugins
lib/shim/gnu/basename/overlay
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block host_libs %}
lib/c
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
bld/shebangs
bld/pkg/config
bin/ld(for_target={{target.gnu.three}})
{% endblock %}

{% block make_flags %}
-f Makefile.perf
perfexecdir=lib/{{uniq_id}}
NO_SDT=1
NO_LIBPERL=1
NO_LIBPYTHON=1
WERROR=0
NO_JVMTI=1
ARCH={{target.linux_arch}}
HOSTCC=${HOST_CC}
HOSTAR=llvm-ar
HOSTLD=${HOST_CC}
{% if verbose %}
V=1
{% endif %}
{% endblock %}

{% block build_flags %}
wrap_cc
no_werror
{% endblock %}

{% block patch %}
fix_shebangs check-headers.sh
find . -type f | while read l; do
    sed -e 's|/tmp/|/var/tmp/|g' -i ${l}
done
{% endblock %}

{% block cpp_defines %}
YYNOMEM=YYENOMEM
{% endblock %}
