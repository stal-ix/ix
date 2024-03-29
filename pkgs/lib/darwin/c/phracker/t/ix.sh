{% extends '//lib/darwin/c/t/ix.sh' %}

{% block step_unpack %}
cd ${out}
extract 1 ${src}/Mac*
{% endblock %}

{% block env %}
export MACOSX_DEPLOYMENT_TARGET={{sdk_target}}
export CXXFLAGS="-Wno-elaborated-enum-base \${CXXFLAGS}"
export ac_cv_func_mempcpy=no
export ac_cv_func_strchrnul=no
export ac_cv_func_secure_getenv=no
export ac_cv_func_strverscmp=no
export ac_cv_func_sendfile=no
export ac_cv_func_getaddrinfo=yes
export ac_cv_buggy_getaddrinfo=no
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{{super()}}
{% endblock %}
