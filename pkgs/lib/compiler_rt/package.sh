{% extends '//mix/template/template.sh' %}

{% block deps %}
# bld {{'lib/musl' | linux}} env/c/nort boot/final/env/tools
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
