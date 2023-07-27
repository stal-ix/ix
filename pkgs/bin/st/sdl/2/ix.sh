{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/Kufat/st-sdl
{% endblock %}

{% block git_commit %}
050eb14a2438836d600bfbacc04754a1ea7d56b3
{% endblock %}

{% block git_sha %}
c09117fc90a33328ad0a5683edf5931b0901b25ab5d18084183d6166bdf00bf5
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

{% block bld_tool %}
bld/pkg/config
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

sed -e 's|.*tic -s.*||' \
    -e 's|/usr/|nowhere|' \
    -i Makefile

sed -e 's|/usr/|nowhere|' \
    -i config.mk
{% endblock %}
