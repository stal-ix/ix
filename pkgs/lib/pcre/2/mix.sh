{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/PhilipHazel/pcre2/archive/refs/tags/pcre2-10.39.tar.gz
c296b9ad214136b814e9ecbbf22d3c42
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/z
lib/bzip2
{% endblock %}

{% block configure_flags %}
--enable-pcre2grep-libz
--enable-pcre2grep-libbz2
--enable-newline-is-anycrlf
--enable-utf8
--enable-jit
--enable-c++
{% endblock %}
