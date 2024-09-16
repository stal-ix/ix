{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/folkertvanheusden/HTTPing/archive/refs/tags/v4.1.0.tar.gz
sha:41b29bedd19ad2aa0f744149c70ad925c9f28400717dcefbdaf77d321176cbfb
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/openssl
{% endblock %}

{% block cpp_missing %}
libintl.h
{% endblock %}
