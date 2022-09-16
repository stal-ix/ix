{% extends '//lib/c++/14/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/15/ver.sh' %}
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/include/stdatomic.h
{% endblock %}
