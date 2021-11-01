{% extends '//mix/template/template.sh' %}

{% block deps %}
# bld lib/c/mix.sh
# bld env/c/nort/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block postunpack %}
cd compiler-rt
{% endblock %}

{% block build %}
for x in lib/builtins/*.c; do
    clang ${CPPFLAGS} ${CFLAGS} -c $x
done

ar q libcompiler_rt.a *.o
ranlib libcompiler_rt.a
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp libcompiler_rt.a ${out}/lib/
{% endblock %}
