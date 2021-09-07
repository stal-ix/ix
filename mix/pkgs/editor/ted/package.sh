# url https://github.com/pg83/zm/archive/bbb08bb69488750d2fe90a9c5a34cf1813abc495.zip
# md5 3a0a43051a644fa3a3e48d17fb97bcef
# lib dev/lang/python3 pypi/pygments shell/dash/minimal
# dep env/std

build() {
    $untar $src/*.zip && mv zm*/ted $out/ && cd $out

    mkdir bin && cd bin

    cat << EOF > ted
#!$(which dash)
export PYTHONPATH="$PYTHONPATH"
export PYTHONDONTWRITEBYTECODE=1

exec $(which python3) "$out/ted/ted" "\$@"
EOF

    chmod +x ted
}
