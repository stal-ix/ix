{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/f14cc2379834cf0560d9bfab4f646163766f4915.tar.gz
71271e058ac9cf41fe84720b25f22f9fe4d2b9156d45c5904d06bb445b2c213c
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
