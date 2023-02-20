{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/2.46.1.tar.gz
sha:76b41d02a41a03d627fcd7fe695cad7f521b66e99a04ec9678f132a1eb052bb8
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
