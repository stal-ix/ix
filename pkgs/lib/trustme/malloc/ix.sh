{# the trustme allocator on wasm32 linear memory; the default lib/c/alloc
   for wasi targets, in place of the dlmalloc that wasi-libc bundles #}

{% extends '//die/inline/library.sh' %}

{% block bld_libs %}
lib/c/naked
lib/c++/dispatch
{% endblock %}

{% block sources %}
malloc.cpp
{% endblock %}
