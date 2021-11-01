# url https://golang.org/dl/go1.4-bootstrap-20170531.tar.gz
# md5 d2cc61cb9f829b3510ee39c0c5568014
# bld shell/cli/bash/minimal/mix.sh
# bld env/std/mix.sh

build() {
    cd ${out} && ${untar} ${src}/go* && cd go*

    setup_compiler

    (
        export GOROOT_FINAL="${out}/go"
        cd src && cat run.bash | grep -v 'time go test' > qw && mv qw run.bash && bash ./all.bash
    )

    cd ${out} && ln -s go/bin ./

    cat << EOF > ${out}/env
export GOROOT_BOOTSTRAP="${out}/go"
EOF
}
