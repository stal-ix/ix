{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/pg83/heirloom/archive/refs/tags/v1.tar.gz
sha:9bb2c524545ab88d5c7001f3be2f8228316577d84640db0fbde2b399bc81b147
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/make
{% endblock %}

{% block c_rename_symbol %}
getopt
optind
optopt
optarg
opterr
{% endblock %}

{% block cpp_defines %}
EXTERN=extern
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/heirloom/libcommon -I${PWD}/heirloom/libuxre ${CPPFLAGS}"
export LDFLAGS="-L${PWD}/heirloom/libcommon -L${PWD}/heirloom/libuxre ${LDFLAGS}"
export CFLAGS="-w -fcommon ${CFLAGS}"
export PATH="${out}/bin:${PATH}"
{% endblock %}

{% block patch %}
: patch
{% if target.os == 'darwin' %}
>heirloom/libcommon/CHECK
>heirloom/libcommon/headers
>heirloom/libcommon/malloc.h
echo 'char* pfmt_label__;' >> heirloom/nawk/lib.c
echo 'char* pfmt_label__;' >> heirloom/grep/alloc.c
echo 'char* pfmt_label__;' >> heirloom/diff/diff.c
echo 'char* pfmt_label__;' >> heirloom/diff/diffh.c
echo 'int sysv3;' >> heirloom/diff/diff.c
echo 'char* pfmt_label__;' >> heirloom/cmp/cmp.c
{% endif %}
{% endblock %}

{% block build %}
export MAKE="{% block heirloom_make %}make{% endblock %}"

xmake() (
  ${MAKE} -f Makefile.mk CC=${CC} AR=${AR} RANLIB=${RANLIB} \
          INSTALL=install STRIP=true CFLAGS="${CFLAGS}"     \
          ROOT= LIBDIR="${out}/bin/lib" BINDIR="${out}/bin" \
          MANDIR="${out}/man" YACC=yacc LEX=lex             \
          HOSTCC="${CC} ${CPPFLAGS} ${CFLAGS}"              \
          UCBINST=install LNS="ln -s" MANINST=install       \
          SV3BIN="${out}/bin" SU3BIN="${out}/bin"           \
          SUSBIN="${out}/bin" DEFBIN="${out}/bin"           \
          S42BIN="${out}/bin" DEFLIB="${out}/bin/lib" "$@"
)

(cd heirloom-devtools/yacc; xmake; xmake install)
(cd heirloom-devtools/lex; xmake; xmake install)

cd heirloom

(cd libcommon; xmake)
(cd libuxre; xmake)

for x in {% block heirloom_tools %}{% endblock %}; do (
    cd ${x}

    xmake LCOMMON="-lcommon" LUXRE="-luxre"
    xmake install
) done
{% endblock %}

{% block install %}
cd ${out}/bin
rm lex yacc
{% endblock %}
