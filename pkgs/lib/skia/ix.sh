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
lib/c++
lib/freetype
lib/harfbuzz
{% endblock %}
