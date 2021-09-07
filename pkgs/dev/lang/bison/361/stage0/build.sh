$untar $src/bison* && cd bison*

(base64 -d | patch -p0) << EOF
{% include 'bison.diff/base64' %}
EOF

export CPPFLAGS="-Derror=b_error -Derror_at_line=b_error_at_line -Derror_message_count=b_error_message_count -Derror_one_per_line=b_error_one_per_line -Derror_print_progname=b_error_print_progname -DGRAM_error=1 $CPPFLAGS"

dash ./configure $COFLAGS --prefix=$out --enable-relocatable

(
    cd src

    rm parse-gram.c parse-gram.h
    bison parse-gram.y
    mv parse-gram.tab.c parse-gram.c
    mv parse-gram.tab.h parse-gram.h
)

make -j $make_thrs
make install
