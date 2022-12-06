{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/PhilipHazel/pcre2/archive/refs/tags/pcre2-10.41.tar.gz
sha:a8a1de4b88333991ae11e22cfdde3e8efe47a71247ece801677869a27d20ac84
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
