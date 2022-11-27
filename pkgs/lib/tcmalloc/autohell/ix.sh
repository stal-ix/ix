{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz
sha:ea566e528605befb830671e359118c2da718f721c27225cbbc93858c7520fee3
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block bld_libs %}
lib/mimalloc/2
# for LTO configure
lib/compiler_rt/builtins/hack/ish
{% endblock %}

{% block patch %}
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

{% block make_target %}
libtcmalloc_minimal.la
{% endblock %}

{% block make_install_target %}
install-libLTLIBRARIES
{% endblock %}

{% block configure_flags %}
--enable-minimal
--enable-sized-delete
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libtcmalloc_minimal_debug.a
{% endblock %}
