{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v0.15.1.tar.gz
sha:27bdd00949ef0b43161002a475f5eeb777929ad96dddd6c9b2f76f14c9be3a69
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
