{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/7.0.3/graphviz-7.0.3.tar.bz2
sha:a424fb1ada42605a3217c4571aa27a40af70a91b4a759ef8f98073690f673c51
{% endblock %}

{% block build_flags %}
wrap_cc
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
bld/fakegit
{% endblock %}

{% block cmake_flags %}
with_gvedit=OFF
enable_ltdl=OFF
{% endblock %}

{% block patch %}
find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's| SHARED| STATIC|' -i ${l}
done

find lib/gvpr -type f | while read l; do
    sed -e 's|nodeInduce|nodeInduceXXX|' -i ${l}
done
{% endblock %}
