# url https://golang.org/dl/go1.16.5.src.tar.gz
# md5 f3c06704e536dcca1814b16dbcdc4a36
# bld tool/gnu/tar dev/lang/go/1.4 dev/lang/python/3/minimal
# bld dev/lang/perl5 shell/bash/minimal env/std

build() {
    cd ${out} && tar xf ${src}/go* && cd go*

    cat << EOF > xcrun
#!$(which python3)
{% include 'xcrun.py' %}
EOF

    chmod +x xcrun

    setup_compiler

    cd src

    sed -e 's/TestMachoIssue32233/skipTestMachoIssue32233/' -i cmd/link/internal/ld/dwarf_test.go
    sed -e 's/TestCurrent/testCurrent/' -i os/user/user_test.go
    sed -e 's/TestLookup/testLookup/' -i os/user/user_test.go

    bash all.bash

    cd ${out} && ln -s go/bin ./

    cat << EOF > ${out}/env
export GOROOT_BOOTSTRAP="${out}/go"
EOF
}
