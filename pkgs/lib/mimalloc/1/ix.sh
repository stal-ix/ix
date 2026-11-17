{% extends '//lib/mimalloc/2/ix.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
1.15.3
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6d454659bf115a00472fa731d2a32ff16c0d3a5c40796472c3d39e1efec0084d
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
