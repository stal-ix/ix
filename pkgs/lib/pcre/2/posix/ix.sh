{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/PhilipHazel/pcre2/archive/refs/tags/pcre2-10.42.tar.gz
sha:a8e52a9bd1bca8f51c5c24823adc2a99acb12288e289a6507090c1a4a4815010
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
PCRE2_BUILD_PCRE2_8=ON
PCRE2_BUILD_PCRE2_16=ON
PCRE2_BUILD_PCRE2_32=ON
PCRE2_NEWLINE=ANYCRLF
PCRE2_SUPPORT_JIT=ON
PCRE2_BUILD_TESTS=OFF
PCRE2_SUPPORT_UNICODE=ON
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir lib/cmake
mv cmake lib/cmake/pcre2
{% endblock %}
