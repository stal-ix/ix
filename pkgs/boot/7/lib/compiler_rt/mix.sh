{% extends '//mix/c_std.sh' %}

{% block bld_libs %}
boot/7/lib/cxx/unwind
{% endblock %}

{% block bld_deps %}
boot/6/env/std
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/t/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd compiler-rt
{% endblock %}

{% block patch %}
rm lib/builtins/atomic*
{% endblock %}

{% block cpp_defines %}
__has_feature\(x\)=0
{% endblock %}

{% block cpp_includes %}
../clang/lib/Headers
{% endblock %}

{% block build %}
for x in lib/builtins/*.c; do
    cc -c ${x}
done

ar qs libcompiler_rt.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libcompiler_rt.a ${out}/lib/
{% endblock %}
