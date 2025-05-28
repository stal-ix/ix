{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nix
{% endblock %}

{% block version %}
2.29.0
{% endblock %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:ffb860e7e6aae5a45bef4cb6d850a272c5f1d4d896a57087212111f110290df8
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
export CFLAGS="${CFLAGS} -UNDEBUG"
{% endblock %}

{% block install %}
mkdir -p ${out}/bin/bin
>${out}/bin/bin/nix
{{super()}}
{% endblock %}
