{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tesseract
{% endblock %}

{% block version %}
5.5.3
{% endblock %}

{% block fetch %}
https://github.com/tesseract-ocr/tesseract/archive/refs/tags/{{self.version().strip()}}.tar.gz
9218e62793116d42a9f6d14cd9348518b27f382096eea3d0f2d1a24616bb5884
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/icu
lib/png
lib/c++
lib/curl
lib/jpeg
lib/tiff
lib/archive
lib/leptonica
{% endblock %}

{% block cmake_flags %}
USE_SYSTEM_ICU=ON
{% endblock %}
