{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pcre2
{% endblock %}

{% block version %}
10.47
{% endblock %}

{% block fetch %}
https://github.com/PCRE2Project/pcre2/releases/download/pcre2-{{self.version().strip()}}/pcre2-{{self.version().strip()}}.tar.gz
c08ae2388ef333e8403e670ad70c0a11f1eed021fd88308d7e02f596fcd9dc16
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
