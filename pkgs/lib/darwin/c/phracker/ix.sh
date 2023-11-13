{% extends '//lib/darwin/c/t/ix.sh' %}

{% block fetch %}
https://github.com/phracker/MacOSX-SDKs/releases/download/11.3/MacOSX11.3.sdk.tar.xz
sha:cd4f08a75577145b8f05245a2975f7c81401d75e9535dcffbb879ee1deefcbf4
{% endblock %}

{% block step_unpack %}
cd ${out}
extract 1 ${src}/Mac*
{% endblock %}

{% block env %}
export MACOSX_DEPLOYMENT_TARGET=11.0
export CXXFLAGS="-Wno-elaborated-enum-base \${CXXFLAGS}"
export ac_cv_func_sendfile=no
export ac_cv_func_getaddrinfo=yes
export ac_cv_buggy_getaddrinfo=no
export ac_cv_func_malloc_0_nonnull=yes
{{super()}}
{% endblock %}
