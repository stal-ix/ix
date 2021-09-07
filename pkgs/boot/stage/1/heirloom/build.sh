$unzip $src/*.zip && cd heirloom*

export SHELL="$0"

export ROOT=

export AR=ar
export CC=clang
export LD=clang
export RANLIB=ranlib
export CPPFLAGS="-w -Dgetopt=h_getopt -Doptarg=h_optarg -Doptind=h_optind -Dopterr=h_opterr -Doptopt=h_optopt -I../libcommon $CPPFLAGS"

export MANDIR=$out/man
export SV3BIN=$out/sv3
export SU3BIN=$out/su3
export S42BIN=$out/s42
export SUSBIN=$out/sus
export UCBBIN=$out/ucb
export DEFBIN=$out/bin
export DEFLIB=$out/lib
export BINDIR=$out/bin
export LIBDIR=$out/lib

export UCBINST=install
export MANINST=install

export PATH="$DEFBIN:$PATH"
export MAKE="bmake RANLIB=$RANLIB"

cd heirloom

(
    cd libcommon

    >CHECK
    >malloc.h

    $MAKE -f Makefile.mk
)

export PRFLAGS="$LDFLAGS"
export LDFLAGS="../libcommon/sysv3.o ../libcommon/pfmt_label.o ../libcommon/libcommon.a $LDFLAGS"

(
    cd rm && $MAKE -f Makefile.mk
)

(
    cd mkdir && $MAKE -f Makefile.mk
)

for i in lib bin share man man/man1 man/man1b man/man2 man/man1n man/man1m; do
    mkdir/mkdir $out/$i
done

for i in $S42BIN $SUSBIN $SV3BIN $UCBBIN $SU3BIN; do
    mkdir/mkdir $i
done

(
    export PATH="$PWD/rm:$PATH"

    cd cp && $MAKE -f Makefile.mk cp
)

cp/cp cp/cp $out/bin
cp rm/rm $out/bin

(
    cd true

    clang $CPPFLAGS $CFLAGS $LDFLAGS -o $out/bin/true -x c - << EOF
int main() {
    return 0;
}
EOF

    clang $CPPFLAGS $CFLAGS $LDFLAGS -o $out/bin/false -x c - << EOF
int main() {
    return 1;
}
EOF
)

export STRIP=true

(
    cd _install && $MAKE -f Makefile.mk
)

cp _install/install_ucb $out/bin/install

(
    cd chmod && $MAKE -f Makefile.mk
)

cp chmod/chmod $out/bin

export LNS=cp

for i in cp rm mkdir _install chmod; do
    (
        cd $i && $MAKE -f Makefile.mk install
    )
done

export LNS=ln
export PATH="$DEFBIN:$UCBBIN:$SUSBIN:$S42BIN:$SV3BIN:$SU3BIN:$PATH"

for i in echo cat pwd env rmdir touch basename dirname chown wc tr ln xargs uniq time test tee tail head sort sleep; do
    (
        cd $i && $MAKE -f Makefile.mk install
    )
done

export MAGIC="$out/share/magic"

export PRCPPFLAGS="$CPPFLAGS"
export CPPFLAGS="-Dcompile=sed_x_compile -Dstep=sed_step -Dadvance=sed_advance -Dnodelim=sed_nodelim -Dsed=sed_sed -Dnbra=sed_nbra -Dloc1=sed_loc1 -Dbraslist=sed_braslist -Dbraelist=sed_braelist -Dloc2=sed_loc2 -Dlocs=sed_locs $CPPFLAGS"

for i in sed cksum cmp col copy cut date dc df dircmp du ed expand file find fmt fold getopt hostname id join kill line logname mkfifo mknod nice nohup printenv printf uname whoami yes; do
    (
        cd $i && $MAKE -f Makefile.mk && $MAKE -f Makefile.mk install
    )
done

(
    export CPPFLAGS="-DUSE_TERMCAP=1 $CPPFLAGS"
    cd ls && $MAKE -f Makefile.mk && $MAKE -f Makefile.mk install
)

(
    export CPPFLAGS="-DEXTERN=extern $CPPFLAGS"
    cd diff && $MAKE -f Makefile.mk && $MAKE -f Makefile.mk install
)

(
    cd ../heirloom-devtools/yacc

    export INSTALL=install
    export LDFLAGS="$PRFLAGS"

    $MAKE -f Makefile.mk && $MAKE -f Makefile.mk install
)

export YACC=yacc
export PATH="$(pwd):$PATH"

ln -s $SHELL sh

export CPPFLAGS="$PRCPPFLAGS"

for i in bc expr factor grep; do
    (
        cd $i && $MAKE -f Makefile.mk && $MAKE -f Makefile.mk install
    )
done

(
    cd ../heirloom-devtools/lex

    export INSTALL=install
    export LDFLAGS="$PRFLAGS"

    $MAKE -f Makefile.mk && $MAKE -f Makefile.mk install
)

(
    cd libuxre

    $MAKE -f Makefile.mk
)

(
    cd nawk

    export LDFLAGS="../libuxre/libuxre.a $LDFLAGS"
    export CPPFLAGS="-I../libuxre $CPPFLAGS"
    export HOSTCC="$CC $CPPFLAGS $CFLAGS $LDFLAGS"

    $MAKE -f Makefile.mk && $MAKE -f Makefile.mk install
)

mv $out/bin $out/tmp && mkdir/mkdir $out/bin

for p in "$SV3BIN" "$SU3BIN" "$S42BIN" "$SUSBIN" "$UCBBIN" "$out/tmp"; do
    cp/cp $p/* $out/bin
done

(
    cd $out/bin && ln -s cat tac && ln -s nawk awk && rm dircmp
)

cat << EOF > $out/env
export ACCEPT_INFERIOR_RM_PROGRAM=yes
export FORCE_UNSAFE_CONFIGURE=1
EOF
