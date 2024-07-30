{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/2.53.1.tar.gz
sha:99c3d739530b08b28a796544ead4254394c7226a873bf813db4e7b3c1524d757
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
