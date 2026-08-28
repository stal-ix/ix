{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nix
{% endblock %}

{% block version %}
2.32.4
{% endblock %}

{% block fetch %}
https://github.com/NixOS/nix/archive/refs/tags/{{self.version().strip()}}.tar.gz
b3a63dab4fc3c89a1a746c6debdef1675ed27530969459e5beb8ce6b3c0d9099
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

sed -i \
    -e "/^readline_flavor =/i\\configdata.set(" \
    -e "/^readline_flavor =/i\\  'HAVE_LOWDOWN_3'," \
    -e "/^readline_flavor =/i\\  lowdown.version().version_compare('>= 3.0.0').to_int()," \
    -e "/^readline_flavor =/i\\)" \
    src/libcmd/meson.build
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

patch -p1 <<'EOF'
--- a/src/libcmd/markdown.cc
+++ b/src/libcmd/markdown.cc
@@ -38,7 +38,9 @@ static std::string doRenderMarkdownToTerminal(std::string_view markdown)
 #  endif
         .feat = LOWDOWN_COMMONMARK | LOWDOWN_FENCED | LOWDOWN_DEFLIST | LOWDOWN_TABLES,
         .oflags =
-#  if HAVE_LOWDOWN_1_4
+#  if HAVE_LOWDOWN_3
+            LOWDOWN_NORELLINK
+#  elif HAVE_LOWDOWN_1_4
             LOWDOWN_TERM_NORELLINK // To render full links while skipping relative ones
 #  else
             LOWDOWN_TERM_NOLINK
EOF
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
