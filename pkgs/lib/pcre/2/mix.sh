{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/PhilipHazel/pcre2/archive/refs/tags/pcre2-10.39.tar.gz
c296b9ad214136b814e9ecbbf22d3c42
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-newline-is-anycrlf
--enable-utf8
--enable-jit
--disable-c++
{% endblock %}
