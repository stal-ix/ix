{% extends '//lib/c++/14/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/15/ver.sh' %}
{% endblock %}

{% block setup %}
{{super()}}
{#/ix/store/JOyuvunDkp0N3TP9-lib-c-plus-plus-15/lib/libc++.a:locale.cpp.o: 0000000000000000 W strtoull_l#}
export OPTFLAGS="${OPTFLAGS} -O2"
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/include/stdatomic.h
sed -e 's|__validate_iter_reference.*;||' -i ${out}/include/__algorithm/iterator_operations.h
{% endblock %}
