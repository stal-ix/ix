{% extends '//mix/template/c_std.sh' %}

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
cd compiler-rt
{% endblock %}

{% block patch %}
rm lib/builtins/atomic*
{% endblock %}

{% block setup %}
export CPPFLAGS="'-D__has_feature(x)=0' -I../clang/lib/Headers -I${CPPFLAGS}"
{% endblock %}

{% block build %}
for x in lib/builtins/*.c; do
    cc -c ${x}
done

ar qs libcompiler_rt.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp libcompiler_rt.a ${out}/lib/
{% endblock %}
