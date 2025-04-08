{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/2.28.1.tar.gz
sha:5081f335d5d4754e0a34f47ea76b3826faa1108f464aa5b7f6c4d43034b07bc1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/git/2
lib/cpuid
lib/boost
lib/kernel
lib/brotli
lib/sodium
lib/bzip/2
lib/toml/11
lib/lowdown
lib/seccomp
lib/openssl
lib/archive
lib/blake3/c
lib/editline
lib/sqlite/3
lib/rapidcheck
lib/google/test
lib/boehmgc/c++
lib/bsd/overlay
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bin/jq
bld/bash
bld/flex
bld/bison
bin/lowdown
bld/auto/archive
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_tool %}
bld/meson/6
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|-Werror=suggest-override||g' \
        -e 's|-Werror=switch-enum||g' \
        -e 's|-Werror=undef||g' \
        -e 's|.*prelink.*true.*||' \
        -i ${l}
done
{% endblock %}

{% block meson_flags %}
unit-tests=false
bindings=false
{% endblock %}

{% block cpp_defines %}
SYS_close_range=436
{% endblock %}

{% block setup_target_flags %}
# https://github.com/NixOS/nix/pull/9997/commits/64cbd4c05a413eae55cde784594472f921fc7367
export OPTFLAGS="${OPTFLAGS} -UNDEBUG"
{% endblock %}

{% block install %}
mkdir -p ${out}/bin/bin
>${out}/bin/bin/nix
{{super()}}
{% endblock %}
