{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/LightGBM/releases/download/v3.3.5/LightGBM-complete_source_code_tar_gz.tar.gz
sha:2a08ad905533a9fcc9c9551e06e7c12532d86cd22d9fe1aa0f6fc126ab53be77
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
