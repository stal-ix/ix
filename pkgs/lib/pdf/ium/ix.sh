{# PDFium, Chrome's PDF engine, as one static library over the C API in
   public/: no V8, no XFA, no Skia, the AGG rasterizer and the bundled
   FreeType with PDFium's own module set.

   PDFium's own build is GN over Chromium's build tree, which gclient
   pulls in with a dozen more repositories. This builds the same sources
   flat: gn_sources.py reads the source lists out of PDFium's BUILD.gn
   files, evaluating the few conditions they use, and the compiler gets
   the handful of defines GN would pass. Of Chromium's tree only two
   headers are read, build/build_config.h and build/buildflag.h, written
   here for our targets. FreeType is the commit DEPS pins, as PDFium is
   tested with it; jpeg, zlib and fast_float come from ix. Of abseil the
   core uses two containers in two files, an inlined vector as a scratch
   buffer and a hash set of visited objects: the standard vector and
   unordered_set stand in for them, and abseil is not built.

   ICU is not linked: the core calls seven character functions through
   its USE_SYSTEM_ICUUC path, and unicode/uchar.h here answers them with
   the libc's wide-character tables. #}

{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
pdfium
{% endblock %}

{% block version %}
2025.11.19
{% endblock %}

{% block fetch %}
https://github.com/chromium/pdfium/archive/a84323421e94f484faca52dd9d027934eba42ab8.tar.gz
ac65d3c284327cfac6e30fb7a4f3b06d01a1ff232dd98076778e7a9556211770
https://github.com/freetype/freetype/archive/fc9cc5038e05edceec3d0f605415540ac76163e9.tar.gz
5468b4ac1090633dddbb0ccd5544b55fde44cb99f3430271ab34f6ee82533a91
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/z
lib/jpeg
lib/fast/float
{% endblock %}

{# libjpeg's error exit is a longjmp; on a single-shot sandbox that is a
   trap, and the host drops the instance #}
{% block bld_libs %}
{% if wasi %}
lib/shim/setjmp
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}

{% block cxx_flags %}
-std=c++20
-fno-exceptions
-fno-rtti
{% endblock %}

{% block cpp_defines %}
NDEBUG
USE_SYSTEM_ICUUC
USE_SYSTEM_LIBJPEG
USE_LIBJPEG_TURBO=1
USE_SYSTEM_ZLIB
OPJ_STATIC
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract1 ${src}/*a84323421e94f484faca52dd9d027934eba42ab8*
mkdir -p third_party/freetype/src
(cd third_party/freetype/src; extract1 ${src}/*fc9cc5038e05edceec3d0f605415540ac76163e9*)
{% endblock %}

{% block build %}
# Chromium's two headers, the standard containers under abseil's names,
# and a redirect for fast_float, which the sources name by Chromium's path
mkdir -p shim/build shim/unicode
mkdir -p shim/third_party/abseil-cpp/absl/container
mkdir -p shim/third_party/fast_float/src/include/fast_float

cat << 'EOF' > shim/build/buildflag.h
{{ix.load_file('buildflag.h')}}
EOF

cat << 'EOF' > shim/build/build_config.h
{{ix.load_file('build_config.h')}}
EOF

cat << 'EOF' > shim/unicode/uchar.h
{{ix.load_file('uchar.h')}}
EOF

cat << 'EOF' > shim/third_party/abseil-cpp/absl/container/inlined_vector.h
#pragma once
#include <memory>
#include <vector>
namespace absl {
template <typename T, size_t N, typename A = std::allocator<T>>
using InlinedVector = std::vector<T, A>;
}
EOF

cat << 'EOF' > shim/third_party/abseil-cpp/absl/container/flat_hash_set.h
#pragma once
#include <functional>
#include <memory>
#include <unordered_set>
namespace absl {
template <typename K, typename H = std::hash<K>, typename E = std::equal_to<K>, typename A = std::allocator<K>>
using flat_hash_set = std::unordered_set<K, H, E, A>;
}
EOF
echo '#include <fast_float/fast_float.h>' > shim/third_party/fast_float/src/include/fast_float/fast_float.h

cat << 'EOF' > gn_sources.py
{{ix.load_file('gn_sources.py')}}
EOF

# the library targets' sources; fxcrt/css and fpdfsdk/fpdfxfa are XFA's
python3 gn_sources.py . $(find core fpdfsdk fxjs constants -name BUILD.gn | sort) third_party/BUILD.gn \
    | grep -v '^core/fxcrt/css/\|^fpdfsdk/fpdfxfa/' > sources.txt
echo "sources: $(wc -l < sources.txt)"

cat << 'EOF' > compile.sh
#!/bin/sh
# one source to its object; the bundled FreeType is built as the library
set -eu
f=$1
o=obj/$(echo "${f}" | tr / _).o
case ${f} in
    third_party/freetype/*)
        ${CC} ${CPPFLAGS} ${CFLAGS} ${COMMON} -DFT2_BUILD_LIBRARY -c "${f}" -o "${o}";;
    *.c)
        ${CC} ${CPPFLAGS} ${CFLAGS} ${COMMON} -c "${f}" -o "${o}";;
    *)
        ${CXX} ${CPPFLAGS} ${CXXFLAGS} ${COMMON} -c "${f}" -o "${o}";;
esac
EOF

# the two FreeType config defines carry the quotes the sources need: the
# compile script expands the variable unquoted, which splits it into words
# and leaves the quotes in them
export CC CXX CPPFLAGS CFLAGS CXXFLAGS
export COMMON='-I. -Ishim -Ithird_party/freetype/include -Ithird_party/freetype/src/include -DFT_CONFIG_MODULES_H="freetype-custom-config/ftmodule.h" -DFT_CONFIG_OPTIONS_H="freetype-custom-config/ftoption.h"'

mkdir obj
xargs -P "$(nproc)" -n 1 sh compile.sh < sources.txt
${AR} rcs libpdfium.a obj/*.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include/cpp
cp libpdfium.a ${out}/lib/
cp public/*.h ${out}/include/
cp public/cpp/*.h ${out}/include/cpp/
{% endblock %}
