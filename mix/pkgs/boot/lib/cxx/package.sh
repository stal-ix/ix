{% include '//util/fetch_llvm.sh' %}
# lib boot/lib/cxxrt
# dep boot/stage/2/env

build() {
    {% include 'build.sh' %}
}
