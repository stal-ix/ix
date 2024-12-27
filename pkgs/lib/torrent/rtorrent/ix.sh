{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v0.15.0.tar.gz
sha:f55fb872282a2964049dadb89c4d1fb580a1cef981b9a421991efd5282ca90b7
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
