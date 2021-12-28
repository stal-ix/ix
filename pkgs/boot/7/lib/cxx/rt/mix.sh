{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/libcxxrt/libcxxrt/archive/14bf5d5526056ae1cc16f03b7b8e96108a1e38d0.zip
d5724a37b8d640f67f09cbbdd831a528
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
