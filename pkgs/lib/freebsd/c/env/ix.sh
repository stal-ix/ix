{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-lc -lm -lpthread ${LDFLAGS}"
export gl_cv_func_strcasecmp_works=y
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
