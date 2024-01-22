{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libxmp/libxmp/archive/refs/tags/libxmp-4.6.0.tar.gz
sha:032ed31e9a334078e59dc5e2ca7a14b950712fef8e838328b727570ddbd3dc12
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
find ${out}/lib/cmake -type f | while read l; do
    sed -e 's|libxmp.so.4.6.0|libxmp.a|g' -i ${l}
done
{% endblock %}
