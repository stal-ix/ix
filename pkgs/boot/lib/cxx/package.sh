{% include '//util/fetch_llvm.sh' %}
# lib boot/lib/cxx/rt
{% if mix.platform.target.os == 'linux' %}
# bld boot/lib/linux
{% endif %}
# bld boot/stage/5/env

build() {
    {% include 'build.sh' %}
}
