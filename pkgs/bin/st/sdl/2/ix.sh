{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/Kufat/st-sdl
{% endblock %}

{% block git_commit %}
050eb14a2438836d600bfbacc04754a1ea7d56b3
{% endblock %}

{% block git_sha %}
aa78e4a191f3b3b181dd9a58ed142948a026899dcfbb2671bd4ce6d287be5562
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/sdl/2
lib/sdl/deps
lib/sdl/2/ttf
lib/shim/fake(lib_name=png12)
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
CXX=clang++
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/fake(tool_name=sdl-config)
{% endblock %}

{% block configure %}
make config.h
{% endblock %}

{% block cpp_includes %}
${SDL2_HEADERS}
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|st-256color|xterm|' -i ${l}
done

sed -e 's|.*tic -s.*||' -i Makefile
{% endblock %}

{% block git_version %}
v3
{% endblock %}
