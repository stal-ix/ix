{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
HTTPing
{% endblock %}

{% block version %}
4.4.0
{% endblock %}

{% block fetch %}
https://github.com/folkertvanheusden/HTTPing/archive/refs/tags/v{{self.version().strip()}}.tar.gz
87fa2da5ac83c4a0edf4086161815a632df38e1cc230e1e8a24a8114c09da8fd
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/openssl
{% endblock %}

{% block cpp_missing %}
libintl.h
{% endblock %}
