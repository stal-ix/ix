{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v11.10.1.tar.gz
sha:cb691932fd2935c575fb6f4c93a9aa7ae60a0f167c3b51fbe0029d2134f27199
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/jpeg
lib/gnutls
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cmake_flags %}
WERROR=OFF
{% endblock %}
