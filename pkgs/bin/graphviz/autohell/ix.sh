{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/7.0.6/graphviz-7.0.6.tar.bz2
sha:5c5b6d7a8dc179c6d30bc5d0d52f40be6564164edf0d581ffd7f57a8b8f9afdf
{% endblock %}

{% block make_no_thrs %}
{#
Anton Samokhvalov, [26 Nov 2022 14:29:09]
CC       grammar.lo
<built-in>:10:11: error: use of undeclared identifier 'cc1'
#define GXX_ABI_VERSION 1002
^
<built-in>:10:16: error: use of undeclared identifier 'triple'
#define __GXX_ABI_VERSION 1002
^
<built-in>:205:25: error: source file is not valid UTF-8
#define __UINT32_C_SUFFIX U
^
<built-in>:205:26: error: source file is not valid UTF-8
#define UINT32_C_SUFFIX U
^
<built-in>:205:27: error: source file is not valid UTF-8
#define UINT32_C_SUFFIX U
^
<built-in>:205:29: error: source file is not valid UTF-8
#define UINT32_C_SUFFIX U
^
<built-in>:283:30: error: source file is not valid UTF-8
#define INT_FAST32_MAX 2147483647
^
<built-in>:283:31: error: source file is not valid UTF-8
#define INT_FAST32_MAX 2147483647
^
<built-in>:283:32: error: source file is not valid UTF-8
#define INT_FAST32_MAX 2147483647
^
<built-in>:283:34: error: source file is not valid UTF-8
#define INT_FAST32_MAX 2147483647
^
<built-in>:285:8: error: source file is not valid UTF-8
#define INT_FAST32_FMTd "d"
^
<built-in>:285:9: error: source file is not valid UTF-8
#define INT_FAST32_FMTd "d"
^
<built-in>:285:10: error: source file is not valid UTF-8
#define INT_FAST32_FMTd "d"
^
<built-in>:285:12: error: source file is not valid UTF-8
#define INT_FAST32_FMTd "d"
^
<built-in>:286:24: error: source file is not valid UTF-8
#define INT_FAST32_FMTi "i"
^
<built-in>:286:25: error: source file is not valid UTF-8
#define INT_FAST32_FMTi "i"
^
<built-in>:286:26: error: source file is not valid UTF-8
#define INT_FAST32_FMTi "i"
^
<built-in>:286:28: error: source file is not valid UTF-8
#define INT_FAST32_FMTi "i"
^
<built-in>:287:41: error: source file is not valid UTF-8
#define UINT_FAST32_TYPE unsigned int
^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
CC       scan.lo
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace, preprocessed source, and associated run script.
Stack dump:
    Anton Samokhvalov, [26 Nov 2022 14:29:09]
    0.  Program arguments: /ix/store/RpoAkrQGJUaKyWiR-bin-clang-15/bin/clang --target=x86_64-ix-linux -fcolor-diagnostics -nostdinc -nostdinc++ -w -I/ix/store/zyhuCbChGej8JGCO-lib-gd/include -I/ix/store/c3hT4JWvjnEeTkr9-lib-heif/include -I/ix/store/Lc3mTnmxhO4MMXmF-lib-aom/include -I/ix/store/HH4XuvasWkWkFw2y-lib-x265/include -I/ix/store/gwtBYF7IAr76fGKd-lib-de265/include -I/ix/store/rMQXlH5M4eN0U4ae-lib-dav1d/include -I/ix/store/HtF5RSQPeH5eUyZl-lib-tiff/include -I/ix/store/9QqZSoX3ozEpJjVs-lib-xz/include -I/ix/store/n42tm92sHXg6Rkfi-lib-jpeg-moz/include -I/ix/store/UsZglsVGwzHrbUo5-lib-zstd/include -I/ix/store/4kioewjmPoigN9qX-lib-webp/include -I/ix/store/224rW2ylzW3jdIPf-lib-fontconfig-stock/include -I/ix/store/528A8iItvnjuPKT0-lib-expat/include -I/ix/store/4FDpJyxRCO2Mp4GV-lib-json-c/include -I/ix/store/pKr5BIuJhqiE4RYK-lib-harfbuzz-ft/include -I/ix/store/pKr5BIuJhqiE4RYK-lib-harfbuzz-ft/include/harfbuzz -I/ix/store/Dlpj7vrTiJM0SSPT-lib-glib-ix/include -I/ix/store/Dlpj7vrTiJM0SSPT-lib-glib-ix/include/glib-2.0 -I/ix/store/Dlpj7vrTiJM0SSPT-lib-glib-ix/lib/glib-2.0/include -I/ix/store/YTSp95XY1i19iPOO-lib-magic/include -I/ix/store/0LlKQg9tt95Pj4cP-lib-ffi/include -I/ix/store/1izrEWpsUUTN6znY-lib-intl-gnu/include -I/ix/store/tu8wL891Gy6eGetn-lib-iconv/include -I/ix/store/0qYWKcxFmA80rqeB-lib-pcre-2/include -I/ix/store/Nr3QRmsBBpLpiZVX-lib-freetype-hb/include -I/ix/store/lHMPHNpqVTqQMaf5-lib-png/include -I/ix/store/hRyv7QDg5x9iSz9a-lib-z-ng/include -I/ix/store/AlYnitWh3q47zWYf-lib-bzip-2/include -I/ix/store/z5sy5QgPKQ0WIWpI-lib-brotli/include -I/ix/store/VR3kcIZOhp98giKi-lib-dlfcn/include -I/ix/store/MGhsKdjpW3hBlJrA-lib-tcmalloc-cmake/include -I/ix/store/VWnhT4HG6SCSFe4v-lib-c-plus-plus-15/include -I/ix/store/CKUc4Gpq8g8AJ7CI-lib-musl-noalloc/include -D__STDC_ISO_10646__=201505L -fno-pic -fno-pie -isystem /ix/store/CKUc4Gpq8g8AJ7CI-lib-musl-noalloc/include -isystem /ix/store/RpoAkrQGJUaKyWiR-bin-clang-15/share/include -O2 -DNDEBUG -Wno-deprecated -Wno-implicit-int -Wno-int-conversion -Wno-unused-command-line-argument -DHAVE_CONFIG_H -I. -I../.. -I../../lib -I../../lib/cdt -I/ix/store/h2RprMVeyaVtK8UX-bin-graphviz/include -Wall -Wextra -Wmissing-include-dirs -Wswitch-default -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-qual -Wconversion -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wtrampolines -Wlogical-op -Wno-unknown-pragmas -Wstrict-prototypes -Wpointer-arith -Wall -c grammar.c -o grammar.o -nostdlib -nostdlib++ -L/ix/store/zyhuCbChGej8JGCO-lib-gd/lib -lgd -L/ix/store/c3hT4JWvjnEeTkr9-lib-heif/lib -lheif -L/ix/store/Lc3mTnmxhO4MMXmF-lib-aom/lib -laom -L/ix/store/HH4XuvasWkWkFw2y-lib-x265/lib -lx265 -L/ix/store/gwtBYF7IAr76fGKd-lib-de265/lib -lde265 -L/ix/store/rMQXlH5M4eN0U4ae-lib-dav1d/lib -ldav1d -L/ix/store/HtF5RSQPeH5eUyZl-lib-tiff/lib -ltiffxx -L/ix/store/HtF5RSQPeH5eUyZl-lib-tiff/lib -ltiff -L/ix/store/9QqZSoX3ozEpJjVs-lib-xz/lib -llzma -L/ix/store/n42tm92sHXg6Rkfi-lib-jpeg-moz/lib -lturbojpeg -L/ix/store/n42tm92sHXg6Rkfi-lib-jpeg-moz/lib -ljpeg -L/ix/store/UsZglsVGwzHrbUo5-lib-zstd/lib -lzstd -L/ix/store/4kioewjmPoigN9qX-lib-webp/lib -lwebpmux -L/ix/store/4kioewjmPoigN9qX-lib-webp/lib
#}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gd
lib/expat
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
mv dot_static dot
rm *_static
{% endblock %}
