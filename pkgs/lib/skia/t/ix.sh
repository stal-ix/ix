{% extends '//die/c/gn.sh' %}

{% block git_repo %}
https://skia.googlesource.com/skia.git
{% endblock %}

{% block git_commit %}
8375bdc6e191da6e39be965969cab4014bfbc8d1
{% endblock %}

{% block git_sha %}
60431f5b34bd5868dac5d504fab25410a2b66ca7c0ddf5c2441e6361e8ada4f6
{% endblock %}

{% block git_refine %}
sed -e 's|.*angle2.*||' \
    -e 's|.*dawn.*||' \
    -e 's|.*swiftshader.*||' \
    -i DEPS
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
