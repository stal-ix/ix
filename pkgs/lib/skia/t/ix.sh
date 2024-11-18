{% extends '//die/c/gn.sh' %}

{% block git_repo %}
https://skia.googlesource.com/skia.git
{% endblock %}

{% block git_commit %}
8375bdc6e191da6e39be965969cab4014bfbc8d1
{% endblock %}

{% block git_sha %}
6887d074c1849bbb7816afdd141a4d081db720783a9d727dff3f69b98fa80885
{% endblock %}

{% block git_refine %}
>bin/fetch-gn
>bin/activate-emsdk
python3 tools/git-sync-deps
find . -name '.git' | while read l; do
    rm -rf ${l}
done
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/icu
lib/webp
lib/jpeg
lib/expat
lib/freetype
lib/harfbuzz
{% endblock %}

{% block cpp_defines %}
__WORDSIZE=64
{% endblock %}

{% block gn_args %}
is_official_build=true
skia_use_piex=false
skia_use_perfetto=false
skia_use_system_harfbuzz=true
skia_use_x11=false
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include/skia
cp ${tmp}/obj/*.a ${out}/lib/
find . -name '*.h' -type f | grep -v 'third_party' | while read l; do
    install -v -D ${l} ${out}/include/skia/${l}
done
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/skia -I${out}/include/skia/include \${CPPFLAGS}"
{% endblock %}
