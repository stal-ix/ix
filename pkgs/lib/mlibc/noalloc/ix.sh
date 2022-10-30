{% extends '//lib/mlibc/pure/ix.sh' %}

{% block c_rename_symbol %}
{{super()}}
free
malloc
calloc
realloc
reallocarray
posix_memalign
aligned_alloc
{% endblock %}

{% block patch %}
{{super()}}

cat << EOF > options/internal/include/mlibc/allocator.hpp
{% include 'allocator.h' %}
EOF

cat << EOF > options/internal/generic/allocator.cpp
{% include 'allocator.cpp' %}
EOF
{% endblock %}
