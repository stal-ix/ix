{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/2.55.0.tar.gz
sha:f5792a1c0499143c716663e90bfb105aaa7ec47d1c4550b5f90ebfc25da00c6c
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
