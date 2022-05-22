{% extends '//lib/boehmgc/ix.sh' %}

{% block lib_deps %}
lib/c/naked
lib/atomicops
{% endblock %}

{% block cmake_flags %}
{{super()}}
enable_redirect_malloc=ON
{% endblock %}

{% block c_rename_symbol %}
strdup
{% endblock %}

{% block patch %}
sed -e 's|USE_DLOPEN_WRAP|_USE_DLOPEN_WRAP|' -i CMakeLists.txt

cat << EOF >> malloc.c
int posix_memalign(void** memptr, size_t alignment, size_t size) {
    return GC_posix_memalign(memptr, alignment, size);
}

void *memalign(size_t alignment, size_t size) {
    return GC_memalign(alignment, size);
}
EOF

{{super()}}
{% endblock %}
