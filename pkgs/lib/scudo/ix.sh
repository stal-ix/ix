{% extends '//die/c_std.sh' %}

{% block fetch %}
{% include '//lib/llvm/14/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd compiler-rt/lib/scudo/standalone
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block cpp_includes %}
${PWD}/include
{% endblock %}

{% block build %}
# https://llvm.org/docs/ScudoHardenedAllocator.html

for x in *.cpp; do
    c++ -c -std=c++17 -msse4.2 -pthread ${x}
done

ar q libscudo.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp -R include ${out}/
cp *.a ${out}/lib/
{% endblock %}
