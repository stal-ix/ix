{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/PhilipHazel/pcre2/archive/refs/tags/pcre2-10.40.tar.gz
sha:a057381270857d01a1a8b2c2fcf176b1c3c6aea595d586649755c33a5843d52f
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
