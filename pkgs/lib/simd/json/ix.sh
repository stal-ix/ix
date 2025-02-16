{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v3.12.1.tar.gz
sha:b73e21f78eabdaf89bf026d8ef0d65d2f1a9bfdc1cb26659c4ec88959989bf70
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
