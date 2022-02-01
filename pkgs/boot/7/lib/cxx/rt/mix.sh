{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/libcxxrt/libcxxrt/archive/fd484be8d1e94a1fcf6bc5c67e5c07b65ada19b6.tar.gz
sem:a20b0a1ae9952bb6141af8828b1e2d28
{% endblock %}

{% block lib_deps %}
boot/7/lib/cxx/unwind
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/6/env/std
{% endblock %}

{% block build %}
for s in src/*.cc; do
    c++ -c ${s}
done

for s in src/*.c; do
    cc -c ${s}
done

ar qs libcxxrt.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include

cp libcxxrt.a ${out}/lib/
cp src/*.h ${out}/include/
{% endblock %}
