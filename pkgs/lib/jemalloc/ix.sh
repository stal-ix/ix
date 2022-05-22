{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/jemalloc/jemalloc/archive/refs/tags/5.3.0.tar.gz
sha:ef6f74fd45e95ee4ef7f9e19ebe5b075ca6b7fbe0140612b2a161abafb7ee179
{% endblock %}

{% block autoreconf %}
autoconf
{% endblock %}

{% block configure_flags %}
--disable-cxx
--disable-libdl
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libjemalloc_pic.a
llvm-objcopy --redefine-sym=je_reallocarray=reallocarray ${out}/lib/libjemalloc.a
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/c++
lib/mimalloc/2
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
JEMALLOC_BACKGROUND_THREAD=1
{% endblock %}

{% block patch %}
cat << EOF >> src/jemalloc.c
static inline bool size_multiply_overflow(size_t size, size_t need) {
    return need != 0 && size > (SIZE_MAX / need);
}

void* reallocarray(void* p, size_t need, size_t size) {
    if (size_multiply_overflow(size, need)) {
        errno = ENOMEM;

        return NULL;
    }

    return realloc(p, size * need);
}
EOF
{% endblock %}
