{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nix
{% endblock %}

{% block version %}
2.35.2
{% endblock %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/{{self.version().strip()}}.tar.gz
f71711db9831d1e58d0fccf01cf2db83315b58da00300334d214e4de90b1759e
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
lib/json/nlohmann(libnlohmann_json_ver=12)
{% endblock %}

{% block bld_tool %}
bin/jq
bld/bash
bld/flex
bin/lowdown
bin/bison/3/8
bld/auto/archive
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_tool %}
bld/meson/9
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|-Werror=suggest-override||g' \
        -e 's|-Werror=switch-enum||g' \
        -e 's|-Werror=undef||g' \
        -e 's|-Werror=weak-vtables||g' \
        -e 's|-Werror=sign-compare||g' \
        -e 's|-Werror=non-virtual-dtor||g' \
        -e 's|.*prelink.*true.*||' \
        -i ${l}
done

sed -i \
    -e 's|return std::string(s.begin(), i);|return std::string(s.substr(0, i));|' \
    src/libutil/args.cc
sed -i \
    -e 's|return {s, size_t(p - s)};|return {s, p};|' \
    src/libstore/names.cc
sed -i \
    -e 's|std::cmatch match;|std::match_results<std::string_view::const_iterator> match;|' \
    src/libstore/outputs-spec.cc \
    src/libexpr/primops.cc \
    src/nix/diff-closures.cc \
    src/nix/nix-build/nix-build.cc
sed -i \
    -e 's|std::cregex_iterator|std::regex_iterator<std::string_view::const_iterator>|g' \
    src/libexpr/primops.cc
sed -i \
    -e '/^static inline Value \* mkString(EvalState & state, const std::csub_match & match)$/i\template<typename Iterator>' \
    -e 's|const std::csub_match & match)|const std::sub_match<Iterator> \& match)|' \
    src/libexpr/primops.cc

{% endblock %}

{% block meson_flags %}
unit-tests=false
functional-tests=false
json-schema-checks=false
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
