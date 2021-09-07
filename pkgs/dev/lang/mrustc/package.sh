# url https://github.com/pg83/mrustc/archive/refs/heads/master.zip
# md5 de37572dae52a8249bb3fabfb3f5532b
# url https://static.rust-lang.org/dist/rustc-1.29.0-src.tar.gz
# md5 54c3f0ffb826bdcc2a7395468828a94c
# url https://static.rust-lang.org/dist/rustc-1.19.0-src.tar.gz
# md5 75e779670ac79edf023497a9c37eb35d
# dep lib/z lib/cxx lib/curl lib/iconv lib/openssl
# dep tool/curl shell/bash/minimal dev/vcs/git tool/gnu/tar tool/gnu/time
# dep dev/lang/python3 dev/build/make dev/build/cmake env/std

build() {
    {% include 'build.sh' %}
}
