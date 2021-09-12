# url https://github.com/michaelforney/sbase/archive/3eb89c44aa788c1b122e7967f4a7a9a3b98322e9.zip
# md5 f723abda51962a5f8d2656820b1ce71a
# dep boot/stage/2/heirloom boot/stage/2/bmake boot/stage/2/shutil boot/stage/1/env

build() {
    $unzip $src/*.zip && cd sbase*

    chmod +x getconf.sh
    setup_compiler
    ln -s $(which clang) cc

    bmake
    bmake PREFIX="$out" install
}
