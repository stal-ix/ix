{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/Kufat/st-sdl
{% endblock %}

{% block git_commit %}
050eb14a2438836d600bfbacc04754a1ea7d56b3
{% endblock %}

{% block git_sha %}
3a86f768db5246b6635ebd9222d878860d33edcf645861aec932b5f2461df60b
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

sed -e 's|.*tic -s.*||' -i Makefile
{% endblock %}
