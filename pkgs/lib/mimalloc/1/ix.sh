{% extends '//lib/mimalloc/2/ix.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
1.15.2
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
98e27bef7c978a5a755c34d4534faddc9c0f2b0df25ca0aedfe93736270e5939
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
