{% extends '//lib/gperftools/17/ix.sh' %}

{% block configure_flags %}
--disable-cpu-profiler
--enable-heap-profiler
--disable-debugalloc
--disable-minimal
--enable-sized-delete
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libtcmalloc_minimal.a
rm ${out}/lib/libtcmalloc_minimal.la
rm ${out}/lib/pkgconfig/libtcmalloc_minimal.pc
{% endblock %}
