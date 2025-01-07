{% extends '//lib/mimalloc/2/ix.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v3.0.1.tar.gz
sha:6a514ae31254b43e06e2a89fe1cbc9c447fdbf26edc6f794f3eb722f36e28261
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-3.0 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
