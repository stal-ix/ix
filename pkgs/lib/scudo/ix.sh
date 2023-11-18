{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/latest/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd compiler-rt/lib/scudo/standalone
{% endblock %}

{% block lib_deps %}
lib/c/naked
lib/reallocarray
{% endblock %}

{% block bld_libs %}
lib/kernel
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

{% block env %}
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
