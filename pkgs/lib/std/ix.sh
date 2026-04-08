{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/refs/tags/8.tar.gz
6b41b7fb14580dd4b132ac487947189eaccc1ced3bcd03afc39bc2ed5a7e461c
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/rapidhash
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include
rm -rf tst
cp std/libstd.a ${out}/lib/
find . -type d | while read l; do
    mkdir -p ${out}/include/${l}
done
find . -type f -name '*.h' | while read l; do
    cp ${l} ${out}/include/${l}
done
{% endblock %}

{% block make_target %}
std/libstd.a
{% endblock %}
