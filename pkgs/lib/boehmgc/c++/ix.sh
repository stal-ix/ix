{% extends '//lib/boehmgc/t/ix.sh' %}

{% block lib_deps %}
lib/c++
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
enable_cplusplus=ON
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libgccpp.a
sed -e 's|class traceable_allocator<void> {|class traceable_allocator<void> { public:|' -i ${out}/include/gc/gc_allocator.h
{% endblock %}
