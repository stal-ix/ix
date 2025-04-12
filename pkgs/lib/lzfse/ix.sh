{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lzfse
{% endblock %}

{% block version %}
1.0
{% endblock %}

{% block fetch %}
https://github.com/lzfse/lzfse/archive/refs/tags/lzfse-{{self.version().strip()}}.tar.gz
sha:cf85f373f09e9177c0b21dbfbb427efaedc02d035d2aade65eb58a3cbf9ad267
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
