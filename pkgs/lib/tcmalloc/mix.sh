{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-2.9.1.tar.gz
e340f1b247ff512119a2db98c1538dc1
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block bld_libs %}
lib/c++
lib/mimalloc/2
{% endblock %}

{% block patch %}
sed -e 's|-lstdc++||g' -i Makefile.am

cat << EOF >> src/malloc_extension.cc
static inline bool size_multiply_overflow(size_t size, size_t need) noexcept {
    return need != 0 && size > (SIZE_MAX / need);
}

extern "C" void* reallocarray(void* p, size_t need, size_t size) {
    if (size_multiply_overflow(size, need)) {
        errno = ENOMEM;

        return nullptr;
    }

    return realloc(p, size * need);
}
EOF
{% endblock %}

{% block configure_flags %}
--enable-minimal
--enable-sized-delete
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libtcmalloc_minimal_debug.a
{% endblock %}
