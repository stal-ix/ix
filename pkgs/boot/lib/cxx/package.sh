{% include '//util/fetch_llvm.sh' %}
# lib boot/lib/cxx/rt
{% if mix.platform.target.os == 'linux' %}
# dep boot/lib/linux
{% endif %}
# dep boot/stage/5/env

build() {
    {% include 'build.sh' %}
}
