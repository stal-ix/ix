$untar $src/libiconv* && cd libiconv*

dash ./configure $COFLAGS --prefix=$out
make -j $make_thrs
make install

cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -liconv -lcharset \$LDFLAGS"
export COFLAGS="--with-libiconv-prefix=$out --with-iconv=$out \$COFLAGS"
EOF
