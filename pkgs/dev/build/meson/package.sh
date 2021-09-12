# url https://github.com/mesonbuild/meson/releases/download/0.58.0/meson-0.58.0.tar.gz
# md5 18ac55e3d6a5acb17b5737eb2a15bb5b
# bld env/std
# run {{mix.if_darwin('dev/lang/cctools')}} dev/lang/python3 dev/build/samurai

build() {
    cd $out

    (
        $untar $src/meson*

        ln -s meson* meson
        mkdir bin && cd bin
        ln -s ../meson/meson.py ./meson
    )

    (
        cd meson

        (base64 -d | patch -p1) << EOF
{% include '00.diff/base64' %}
EOF
    )
}
