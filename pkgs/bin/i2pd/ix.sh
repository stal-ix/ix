{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/2.46.0.tar.gz
sha:daa5e47bb2b80fbdaa3836b209e869017893421f5225dfe019e5d43d3f8a86d4
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
