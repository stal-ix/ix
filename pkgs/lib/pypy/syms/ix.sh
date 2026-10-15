{# The C sources the translator itself calls, as a plain archive.

   While translating, the interpreter does not exist yet, so every
   rffi.llexternal the untranslated code actually invokes goes through
   ll2ctypes: it builds that function's ExternalCompilationInfo into a
   .so and dlopens it. A static host python cannot load a .so, and we
   are not putting an ELF loader in the toolchain to make it possible.

   Instead the symbols are linked into the translating process up
   front. lib/pypy/syms/dl registers them in the dl table, and the
   ll2ctypes patch in bin/pypy makes the lookup consult that table
   before it reaches for a shared library.

   This lists only the sources whose functions untranslated code
   reaches. The rest of the runtime is emitted into the generated C and
   compiled there as usual; adding a file here that nobody calls early
   just makes the host python bigger. #}

{% extends '//die/c/ix.sh' %}

{% include '//bin/pypy/t/ver.sh' %}

{% block pkg_name %}
pypy-syms
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cpp_defines %}
RPYTHON_LL2CTYPES=1
PYPY_SIGINT_INTERRUPT_EVENT=1
{# pyexpat's eci gates prototypes in __expat.h on these #}
XML_DTD=1
XML_GE=1
{# rdtoa picks this from the host's byte order before including dtoa.c #}
{% if target.endian == 'little' %}
DOUBLE_IS_LITTLE_ENDIAN_IEEE754=1
{% else %}
WORDS_BIGENDIAN=1
DOUBLE_IS_BIG_ENDIAN_IEEE754=1
{% endif %}
{% endblock %}

{# each source is written against the includes its own eci supplies:
   precommondefs for the RPY_EXTERN spelling, and libm's headers for
   ll_math.c, which declares nothing itself #}
{% block cpp_missing %}
src/precommondefs.h
math.h
float.h
errno.h
{% endblock %}

{# pyexpatns.h renames almost every expat symbol, but not these three.
   The host python already links lib/expat through lib/python/libs, so
   without renaming them the two copies collide at link time. #}
{% block c_rename_symbol %}
XML_SetHashSalt16Bytes
_INTERNAL_trim_to_complete_utf8_characters
g_reparseDeferralEnabledDefault
{% endblock %}

{% block cpp_includes %}
${PWD}/rpython/translator/c
${PWD}/pypy/module/_codecs
${PWD}/pypy/module/pyexpat/src/expat
{% endblock %}

{% block pypy_sources %}
rpython/translator/c/src/signals.c
rpython/translator/c/src/thread.c
rpython/translator/c/src/dtoa.c
rpython/translator/c/src/ll_strtod.c
rpython/translator/c/src/ll_math.c
rpython/translator/c/src/asm.c
pypy/module/_codecs/locale_codec.c
{# pypy vendors expat and renames every XML_* to PyExpat_XML_* through
   pyexpatns.h, so this clashes with nothing and is the only place
   those symbols can come from #}
pypy/module/pyexpat/src/expat/xmlparse.c
pypy/module/pyexpat/src/expat/xmlrole.c
pypy/module/pyexpat/src/expat/xmltok.c
pypy/module/pyexpat/src/expat/xmltok_impl.c
pypy/module/pyexpat/src/expat/xmltok_ns.c
pypy/module/pyexpat/src/expat/random_getrandom.c
pypy/module/pyexpat/src/expat/random_dev_urandom.c
{% endblock %}

{% block build %}
cat << 'IX_EXTERN_C' > ix_extern.c
{{ix.load_file('extern.c')}}
IX_EXTERN_C
cc -c -o ix_extern.o ix_extern.c

for x in {{self.pypy_sources() | parse_list | fjoin(' ')}}; do
    cc -c -o "$(basename ${x} .c).o" "${x}"
done
ar q libpypysyms.a *.o
llvm-nm --defined-only --extern-only libpypysyms.a
{% endblock %}

{% block install %}
mkdir -p ${out}/lib
cp libpypysyms.a ${out}/lib/
{% endblock %}
