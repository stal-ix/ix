{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/pcre/pcre/8.45/pcre-8.45.tar.bz2
4452288e6a0eefb2ab11d36010a1eebb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block cmake_flags %}
PCRE_BUILD_PCRE16=ON
PCRE_BUILD_PCRE32=ON
PCRE_BUILD_PCRECPP=OFF
PCRE_SUPPORT_JIT=ON
PCRE_SUPPORT_PCREGREP_JIT=ON
PCRE_SUPPORT_UNICODE_PROPERTIES=ON
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-pcre=${out} \${COFLAGS}"
{% endblock %}
