{% extends '//lib/compiler_rt/sanitize/t/ix.sh' %}

{% block fetch %}
{# LLVM 20 contains this important commit: https://github.com/llvm/llvm-project/pull/108913 #}
{% include '//lib/llvm/20/ver.sh' %}
{% endblock %}

{% block sanitizer_name %}asan{% endblock %}

{% block allocator_syms %}
{#
The interceptors for these allocation functions in Address Sanitizer
are in fact self-contained and never call the intercepted functions,
so we can just replace them with zeroes here.
#}
aligned_alloc
calloc
free
malloc
malloc_stats
malloc_usable_size
memalign
posix_memalign
realloc
valloc
{% endblock %}

{% block env %}
{{super()}}
{% for x in ix.parse_list(self.allocator_syms()) %}
export LDFLAGS="-Wl,--defsym=__real_{{x}}=0 \${LDFLAGS}"
{% endfor %}
{% endblock %}
