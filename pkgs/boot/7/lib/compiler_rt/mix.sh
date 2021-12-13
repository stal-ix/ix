{% extends '//mix/template/std.sh' %}

{% block bld_libs %}
boot/7/lib/cxx/unwind/mix.sh
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/t/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cp -R clang/lib/Headers compiler-rt
cd compiler-rt
{% endblock %}

{% block patch %}
rm lib/builtins/atomic*
{% endblock %}

{% block build %}
for x in lib/builtins/*.c; do
    cc "-D__has_feature(x)=0" -isystem Headers -c ${x}
done

ar qs libcompiler_rt.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp libcompiler_rt.a ${out}/lib/
{% endblock %}
