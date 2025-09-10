{% extends '//die/c/make.sh' %}

{% block pkg_name %}
readpe
{% endblock %}

{% block version %}
0.85.1
{% endblock %}

{% block fetch %}
https://github.com/mentebinaria/readpe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3218099d94c81488a4b042d86f64a4076835e1f2f2aff8ed4d58f01c20567507
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/gzip
{% endblock %}
