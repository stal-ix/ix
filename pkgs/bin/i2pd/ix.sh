{% extends '//die/c/make.sh' %}

{% block version %}
2.56.0
{% endblock %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:eb83f7e98afeb3704d9ee0da2499205f73bab0b1becaf4494ccdcbe4295f8550
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/openssl
lib/boost/85
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}
