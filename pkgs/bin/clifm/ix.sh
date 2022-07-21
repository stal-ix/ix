{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/leo-arch/clifm/archive/refs/tags/v1.6.tar.gz
sha:303f0ee2c6b19d3612de623c3ae0ee3ac110dcacfc348ec0f1d80015fc5f26e1
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/acl
lib/magic
lib/readline
{% endblock %}
