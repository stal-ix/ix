{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.2.1/upx-4.2.1-src.tar.xz
sha:cc562ea7dbd8cec4505edea68736e04030ec5891c1e2a300e3c0d0eac6364479
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
