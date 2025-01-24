{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/google/tcmalloc/archive/432d115adab8935b0a937d659c345aa8f82add57.tar.gz
sha:a5480b4012f0e36ab03f47479c8ba2f27ea70607156825266e3da84f6a28caf9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/abseil/cpp
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block patch %}
find . -type f -name '*_test.*' -delete
find . -type f -name '*_fuzz.*' -delete
find . -type f -name '*_benchmark.*' -delete
find . -type f -name '*mock_*' -delete
rm tcmalloc/internal/profile_builder.cc
rm tcmalloc/profile_marshaler.cc
rm -rf tcmalloc/testing
{% endblock %}

{% block build %}
set -x
find tcmalloc -type f -name '*.cc' | while read l; do
    c++ -c ${l} -o ${l}.o
done
ar q libtcmalloc.a $(find . -type f -name '*.o')
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libtcmalloc.a ${out}/lib/
{% endblock %}
