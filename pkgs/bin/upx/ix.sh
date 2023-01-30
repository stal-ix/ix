{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.0.2/upx-4.0.2-src.tar.xz
sha:1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
