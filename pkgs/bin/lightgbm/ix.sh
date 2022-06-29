{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/LightGBM/releases/download/v3.3.2/LightGBM-complete_source_code_tar_gz.tar.gz
sha:d90242bef13bd5c2f9f6196e57dc2cb0e7bb44bc4b2450ab39f4cce1e0a05dfd
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
{% endblock %}

{% block cmake_flags %}
USE_OPENMP=OFF
{% endblock %}
