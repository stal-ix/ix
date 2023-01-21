{% extends '//lib/mimalloc/2/ix.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v1.7.6.tar.gz
sha:d74f86ada2329016068bc5a243268f1f555edd620b6a7d6ce89295e7d6cf18da
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
{% endblock %}
