{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.2.3/upx-4.2.3-src.tar.xz
sha:d6357eec6ed4c1b51f40af2316b0958ff1b7fa6f53ef3de12da1d5c96d30e412
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
