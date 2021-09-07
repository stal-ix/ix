# url https://github.com/pg83/ted/archive/3c3f54a69b806bd7eb96f4c56189ce2a7f0507c5.zip
# md5 qw
# lib dev/lang/python3 pypi/pygments shell/dash/minimal
# dep env/std

build() {
    $untar $src/*.zip && mv ted* $out/ted && cd $out

    mkdir bin && cd bin

    cat << EOF > ted
#!$(which dash)
export PYTHONPATH="$PYTHONPATH"
export PYTHONDONTWRITEBYTECODE=1

exec $(which python3) "$out/ted/ted" "\$@"
EOF

    chmod +x ted
}
