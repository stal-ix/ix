{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/heirloom/archive/a47c4acf9fb43b89f9fb0afdcf9008121d50d806.zip
# md5 19b59804cf21bf9bd266d9cb261ecb2c
{% endblock %}

{% block deps %}
# bld boot/stage/2/bmake
# bld boot/stage/2/shutil
# bld boot/stage/1/env
{% endblock %}

{% block preconf %}
{% endblock %}

{% block build %}
export SHELL="$0"

export ROOT=

export AR=ar
export CC=clang
export LD=clang
export RANLIB=ranlib
export CPPFLAGS="-D_BSD_SOURCE -w -Dgetopt=h_getopt -Doptarg=h_optarg -Doptind=h_optind -Dopterr=h_opterr -Doptopt=h_optopt -I../libcommon ${CPPFLAGS} -O0 -g"

export MANDIR=${out}/man
export SV3BIN=${out}/sv3
export SU3BIN=${out}/su3
export S42BIN=${out}/s42
export SUSBIN=${out}/sus
export UCBBIN=${out}/ucb
export DEFBIN=${out}/bin
export DEFLIB=${out}/lib
export BINDIR=${out}/bin
export LIBDIR=${out}/lib

export UCBINST=install
export MANINST=install

export PATH="${DEFBIN}:${PATH}"
export MAKE="make RANLIB=${RANLIB}"

>malloc.h

export CPPFLAGS="-I${PWD} ${CPPFLAGS}"

cd heirloom

(
    set -eu

    cd libcommon

    >CHECK
    >malloc.h

    $MAKE -f Makefile.mk
) || exit 1

export PRFLAGS="${LDFLAGS}"
export LDFLAGS="../libcommon/asciitype.o ../libcommon/getdir.o ../libcommon/getopt.o ../libcommon/gmatch.o ../libcommon/ib_alloc.o ../libcommon/ib_close.o ../libcommon/ib_free.o ../libcommon/ib_getlin.o ../libcommon/ib_getw.o ../libcommon/ib_open.o ../libcommon/ib_popen.o ../libcommon/ib_read.o ../libcommon/ib_seek.o ../libcommon/pathconf.o ../libcommon/pfmt_label.o ../libcommon/pfmt.o ../libcommon/regexpr.o ../libcommon/setlabel.o ../libcommon/setuxlabel.o ../libcommon/sighold.o ../libcommon/sigignore.o ../libcommon/signal.o ../libcommon/sigpause.o ../libcommon/sigrelse.o ../libcommon/sigset.o ../libcommon/strtol.o ../libcommon/sysv3.o ../libcommon/utmpx.o ../libcommon/vpfmt.o {{'../libcommon/memalign.o' | darwin}} $PRFLAGS"

(
    set -eu

    cd rm && $MAKE -f Makefile.mk
) || exit 1

(
    set -eu

    cd mkdir && $MAKE -f Makefile.mk
) || exit 1

for i in lib bin share man man/man1 man/man1b man/man2 man/man1n man/man1m; do
    mkdir/mkdir ${out}/$i
done

for i in $S42BIN $SUSBIN $SV3BIN $UCBBIN $SU3BIN; do
    mkdir/mkdir $i
done

(
    set -eu

    export PATH="${PWD}/rm:${PATH}"
    export LDFLAGS="../libcommon/*.o $PRFLAGS"

    cd cp && $MAKE -f Makefile.mk cp
) || exit 1

cp/cp cp/cp ${out}/bin
cp rm/rm ${out}/bin

(
    set -eu

    cd true

    clang ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -o ${out}/bin/true -x c - << EOF
int main() {
    return 0;
}
EOF

    clang ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -o ${out}/bin/false -x c - << EOF
int main() {
    return 1;
}
EOF
) || exit 1

export STRIP=true

(
    set -eu

    cd _install && $MAKE -f Makefile.mk
) || exit 1

cp _install/install_ucb ${out}/bin/install

(
    set -eu

    cd chmod && $MAKE -f Makefile.mk
) || exit 1

cp chmod/chmod ${out}/bin

export LNS=cp

(
    set -eu

    cd cp

    $MAKE LDFLAGS="../libcommon/*.o $PRFLAGS" -f Makefile.mk install
) || exit 1

for i in rm mkdir _install chmod; do
    (
        set -eu

        cd $i && $MAKE -f Makefile.mk install
    ) || exit 1
done

export LNS=ln
export PATH="$DEFBIN:$UCBBIN:$SUSBIN:$S42BIN:$SV3BIN:$SU3BIN:${PATH}"

for i in echo pwd env rmdir touch basename dirname chown wc tr ln xargs uniq time test tee tail head sort sleep; do
    (
        set -eu

        cd $i && $MAKE CPPFLAGS="{{'-Dmode_t=int' | linux}} ${CPPFLAGS}" -f Makefile.mk install
    ) || exit 1
done

{% if mix.platform.target.os == 'linux' %}
echo 'extern void* memalign(size_t, size_t);' > libcommon/memalign.h

(
    set -eu

    cd libcommon && rm *.o *.a && $MAKE -f Makefile.mk
) || exit 1
{% endif %}

for i in cp cat copy; do
    (
        set -eu

        cd $i

        $MAKE LDFLAGS="../libcommon/sfile.o ../libcommon/oblok.o ${LDFLAGS}" -f Makefile.mk install
    ) || exit 1
done

export MAGIC="${out}/share/magic"
export PRCPPFLAGS="${CPPFLAGS}"
export CPPFLAGS="-Dcompile=sed_x_compile -Dstep=sed_step -Dadvance=sed_advance -Dnodelim=sed_nodelim -Dsed=sed_sed -Dnbra=sed_nbra -Dloc1=sed_loc1 -Dbraslist=sed_braslist -Dbraelist=sed_braelist -Dloc2=sed_loc2 -Dlocs=sed_locs ${CPPFLAGS}"

{% if mix.platform.target.os == 'linux' %}
mkdir sys

cat << EOF > sys/mkdev.h
#include <sys/sysmacros.h>
EOF

export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
{% endif %}

for i in file find sed cksum cmp col cut dc df dircmp du ed expand fmt fold getopt hostname id join kill line logname mkfifo mknod nice nohup printenv printf uname whoami yes; do
    (
        set -eu

        cd $i

        $MAKE PATH="${PATH}" LDFLAGS="${LDFLAGS}" -f Makefile.mk && $MAKE -f Makefile.mk install
    ) || exit 1
done

(
    set -eu

    export CPPFLAGS="-DUSE_TERMCAP=1 {{'-D_AIX' | linux}} ${CPPFLAGS}"
    cd ls
    $MAKE LDFLAGS="${LDFLAGS}" -f Makefile.mk && $MAKE -f Makefile.mk install
) || exit 1

(
    set -eu

    export CPPFLAGS="-DEXTERN=extern ${CPPFLAGS}"
    cd diff
    $MAKE LDFLAGS="${LDFLAGS}" -f Makefile.mk && $MAKE -f Makefile.mk install
)|| exit 1

(
    set -eu

    cd ../heirloom-devtools/yacc

    $MAKE LDFLAGS="$PRFLAGS" -f Makefile.mk && $MAKE INSTALL=install -f Makefile.mk install
) || exit 1

export YACC=yacc
export PATH="$(pwd):${PATH}"

# for factor
ln -s $(which dash) sh
export PATH="${PWD}:${PATH}"

export CPPFLAGS="$PRCPPFLAGS"

for i in bc expr factor grep; do
    (
        set -eu

        cd $i && $MAKE PATH="${PATH}" LDFLAGS="${LDFLAGS}" -f Makefile.mk && $MAKE -f Makefile.mk install
    ) || exit 1
done

(
    set -eu

    cd ../heirloom-devtools/lex

    $MAKE LDFLAGS="$PRFLAGS" -f Makefile.mk && $MAKE INSTALL=install -f Makefile.mk install
) || exit 1

(
    set -eu

    cd libuxre

    $MAKE CPPFLAGS="-I. ${CFLAGS} ${CPPFLAGS}" -f Makefile.mk
) || exit 1

(
    set -eu

    cd nawk

    export LDFLAGS="../libuxre/libuxre.a ${LDFLAGS}"
    export CPPFLAGS="-I../libuxre -Dvpfmt=nawk_vpfmt ${CPPFLAGS} ${CFLAGS}"
    export HOSTCC="$CC ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

    $MAKE LDFLAGS="${LDFLAGS}" -f Makefile.mk
    $MAKE -f Makefile.mk install
) || exit 1

export PATH="${out}/tmp:${PATH}"

mv ${out}/bin ${out}/tmp && mkdir $out/bin

for p in "$SV3BIN" "$SU3BIN" "$S42BIN" "$SUSBIN" "$UCBBIN" "${out}/tmp"; do
    cp $p/* ${out}/bin
done

(
    set -eu

    cd ${out}/bin && ln -s nawk awk && rm dircmp
) || exit 1

{% endblock %}

{% block env %}
export ACCEPT_INFERIOR_RM_PROGRAM=yes
export FORCE_UNSAFE_CONFIGURE=1
{% endblock %}
