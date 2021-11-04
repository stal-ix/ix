{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://github.com/libcxxrt/libcxxrt/archive/14bf5d5526056ae1cc16f03b7b8e96108a1e38d0.zip
d5724a37b8d640f67f09cbbdd831a528
{% endblock %}

{% block lib_deps %}
boot/7/lib/cxx/unwind/mix.sh
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block build %}
for s in src/*.cc; do
    g++ -c $s
done

for s in src/*.c; do
    gcc -c $s
done

ar q libcxxrt.a *.o
ranlib libcxxrt.a
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include

cp libcxxrt.a ${out}/lib/
cp src/*.h ${out}/include/
{% endblock %}
