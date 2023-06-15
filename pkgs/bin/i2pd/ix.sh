{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/2.48.0.tar.gz
sha:ccf417aa66ce37f72ea15b7fbcff4c71e823566ea74bda696b9c1e19aae08739
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
