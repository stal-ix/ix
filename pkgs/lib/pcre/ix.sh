{% extends '//die/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/pcre/pcre/8.45/pcre-8.45.tar.bz2
sha:4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8
{% endblock %}

{% block lib_deps %}
lib/c
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

{% block install %}
{{super()}}
rm ${out}/lib/libpcreposix.a ${out}/lib/pkgconfig/libpcreposix.pc ${out}/include/pcreposix.h
{% endblock %}
