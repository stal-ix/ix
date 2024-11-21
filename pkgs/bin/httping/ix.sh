{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/folkertvanheusden/HTTPing/archive/refs/tags/v4.2.0.tar.gz
sha:d6eb16a1f7d8724b883f07ffe71f75ae13f0535dbab077ff19ab8f36ab90d96a
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/openssl
{% endblock %}

{% block cpp_missing %}
libintl.h
{% endblock %}
