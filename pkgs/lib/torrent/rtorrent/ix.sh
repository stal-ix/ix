{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v0.14.0.tar.gz
sha:0ec8ef7544a551ccbf6fce5c6c535f69cb3ad10e4d5e70e620ecd47fef90a13e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
