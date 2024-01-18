{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/13/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c/naked
{% endblock %}

{% block unpack %}
{{super()}}
cd compiler-rt
{% endblock %}

{% block patch %}
rm lib/builtins/atomic*
{% endblock %}

{% block build %}
for x in lib/builtins/*.c; do
    cc -fPIC -c ${x}
done

ar qs libcompiler_rt.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libcompiler_rt.a ${out}/lib/
{% endblock %}
