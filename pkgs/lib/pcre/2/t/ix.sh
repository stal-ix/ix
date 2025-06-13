{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pcre2
{% endblock %}

{% block version %}
10.45
{% endblock %}

{% block fetch %}
https://github.com/PCRE2Project/pcre2/releases/download/pcre2-{{self.version().strip()}}/pcre2-{{self.version().strip()}}.tar.bz2
21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4
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
{% if wasi %}
PCRE2_SUPPORT_JIT=OFF
{% else %}
PCRE2_SUPPORT_JIT=ON
{% endif %}
PCRE2_BUILD_TESTS=OFF
PCRE2_SUPPORT_UNICODE=ON
{% endblock %}
