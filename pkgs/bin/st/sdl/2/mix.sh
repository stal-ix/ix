{% extends '//mix/make.sh' %}

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
{% endblock %}

{% block bld_tool %}
lib/curses/n
{% endblock %}

{% block configure %}
make config.h
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|-lpng12||' -e 's|-lstdc++||' -i ${l}
done
{% endblock %}
