{% extends '//die/c/c_std.sh' %}

{% block fetch %}
https://github.com/libcxxrt/libcxxrt/archive/fd484be8d1e94a1fcf6bc5c67e5c07b65ada19b6.tar.gz
sem:9abbda7bddaa6bfface83d3a2d9054ef09b91bfbe17992c9c8637f677ce5673a
{% endblock %}

{% block lib_deps %}
bld/boot/7/lib/cxx/unwind
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
{% endblock %}

{% block build %}
for s in src/*.cc; do
    c++ -std=c++11 -c ${s}
done

for s in src/*.c; do
    cc -c ${s}
done

ar qs libcxxrt.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp libcxxrt.a ${out}/lib/
cp src/*.h ${out}/include/
{% endblock %}
