{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.0.1/upx-4.0.1-src.tar.xz
sha:77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
