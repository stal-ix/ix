{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.1.0/upx-4.1.0-src.tar.xz
sha:0582f78b517ea87ba1caa6e8c111474f58edd167e5f01f074d7d9ca2f81d47d0
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
