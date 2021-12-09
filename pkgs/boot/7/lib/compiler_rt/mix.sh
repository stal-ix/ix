{% extends '//mix/template/std.sh' %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd compiler-rt
{% endblock %}

{% block build %}
for x in lib/builtins/*.c; do
    clang -c ${x}
done

ar q libcompiler_rt.a *.o
ranlib libcompiler_rt.a
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp libcompiler_rt.a ${out}/lib/
{% endblock %}
