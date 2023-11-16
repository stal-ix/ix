{% extends '//lib/mimalloc/2/ix.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v1.8.2.tar.gz
sha:4058d53d6ceb75862f32c30a6ee686c3cbb5e965b2c324b828ca454f7fe064f9
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
