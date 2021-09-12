# url https://www.crufty.net/ftp/pub/sjg/bmake.tar.gz
# md5 e3059851715a7747f9813f37eaaf4c1d
# dep boot/stage/2/shutil boot/stage/1/env

build() {
    {% include 'build.sh' %}
}
