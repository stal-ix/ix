{% extends '//die/c/pybuild.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/1823073b33e072568b28261b43970e9c81074d37.tar.gz
910d3ac341895fe1eea74da38aed9dd987c9bfb71a1bf54a795d18ef85c910f3
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/rapidhash
lib/linux/headers
{% endblock %}

{% block pybuild_target %}
libstd
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include
cp libstd ${out}/lib/libstd.a
find std -type d | while read l; do
    mkdir -p ${out}/include/${l}
done
find std -type f -name '*.h' | while read l; do
    cp ${l} ${out}/include/${l}
done
{% endblock %}
