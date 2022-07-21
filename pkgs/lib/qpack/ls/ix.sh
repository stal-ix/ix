{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/litespeedtech/ls-qpack/archive/refs/tags/v2.2.3.tar.gz
sha:62f6afb7c662ad7af54fec604e441d7e016ff9fc71f9d80e067e50becf77d1ac
{% endblock %}

{% block lib_deps %}
lib/c
lib/xxhash
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.h ${out}/include/
find ${tmp} -name '*.a' | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}

{% block cmake_flags %}
LSQPACK_BIN=OFF
LSQPACK_XXH=OFF
{% endblock %}
