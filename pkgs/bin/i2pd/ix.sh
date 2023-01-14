{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/2.45.1.tar.gz
sha:a84b1e3cb5ac45f39af98e63291d34725ef67337e11acbe0e245acde7a5b2b72
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/boost
lib/kernel
lib/openssl
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}
