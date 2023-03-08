{% extends '//lib/pcre/2/posix/ix.sh' %}

{% block cmake_flags %}
{{super()}}
PCRE2_BUILD_PCRE2GREP=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm lib/libpcre2-posix.a lib/pkgconfig/libpcre2-posix.pc include/pcre2posix.h
{% endblock %}
