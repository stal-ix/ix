{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Kufat/st-sdl/archive/050eb14a2438836d600bfbacc04754a1ea7d56b3.zip
sha:3ffe0459ac8202023fdaaf9160fdefb309024eca76d7c753d5a5685377d57c18
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
${lib_sdl_2}/include/SDL2
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|st-256color|xterm|' -i ${l}
done

sed -e 's|.*tic -s.*||' -i Makefile
{% endblock %}
