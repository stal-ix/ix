{% extends '//die/c/gn.sh' %}

{% block git_repo %}
https://skia.googlesource.com/skia.git
{% endblock %}

{% block git_commit %}
8375bdc6e191da6e39be965969cab4014bfbc8d1
{% endblock %}

{% block git_sha %}
4451c9e3689604790f5dcc514c948d83e8aec073cfa4de9c41ecb74be55b9aec
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
lib/opengl
lib/freetype
lib/harfbuzz
{% endblock %}

{% block cpp_defines %}
__WORDSIZE=64
{% endblock %}

{% block gn_args %}
is_official_build=true
skia_use_system_harfbuzz=true
skia_use_x11=false
skia_use_egl=true
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include/skia
cp ${tmp}/obj/*.a ${out}/lib/
find include modules -name '*.h' | while read l; do
    install -v -D ${l} ${out}/include/skia/${l}
done
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/skia -I${out}/include/skia/include \${CPPFLAGS}"
{% endblock %}
