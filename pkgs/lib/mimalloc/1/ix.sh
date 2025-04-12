{% extends '//lib/mimalloc/2/ix.sh' %}

{% block version %}
1.8.9
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3aabe30485c4e908c1bf04136d5b95c08c6e73fa6fe6e1ec68b4851d3c60ee47
{% endblock %}

{% block bld_libs %}
lib/c/naked
{% endblock %}

{% block cmake_flags %}
{{super()}}
MI_USE_CXX=OFF
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-1.7 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
