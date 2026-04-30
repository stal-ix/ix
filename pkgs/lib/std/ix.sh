{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/9.tar.gz
3a5283d5e7cdb923f9f64e92cb89874611d96c226f338d5a9f948499c66c9293
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/rapidhash
lib/linux/headers
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
