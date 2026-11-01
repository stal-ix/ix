{% extends '//lib/mimalloc/2/ix.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
3.6.1
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2672e6a99d4579fb4bb32d9de0d63aa424ce600d31fbfaf06eb74d940d2e07a6
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-3.0 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
