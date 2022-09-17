{% extends '//lib/c++/14/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/15/ver.sh' %}
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/include/stdatomic.h
sed -e 's|__validate_iter_reference.*;||' -i ${out}/include/__algorithm/iterator_operations.h
{% endblock %}
