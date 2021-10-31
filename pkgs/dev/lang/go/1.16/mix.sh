# url https://golang.org/dl/go1.16.5.src.tar.gz
# md5 f3c06704e536dcca1814b16dbcdc4a36
# bld gnu/tar/mix.sh
# bld dev/lang/go/1.4/mix.sh
# bld dev/lang/python/3/minimal/mix.sh
# bld dev/lang/perl5/mix.sh
# bld shell/cli/bash/minimal/mix.sh
# bld env/std/mix.sh

build() {
    cd ${out} && tar xf ${src}/go* && cd go*

    cat << EOF > xcrun
#!$(command -v python3)
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
