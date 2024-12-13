{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/2.54.0.tar.gz
sha:5c3f703417bb5f3e5dda642d39c5d30593a5dcf69d5a5ecfe82d5e8a7d454aaf
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
