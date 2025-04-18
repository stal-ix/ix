{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tesseract
{% endblock %}

{% block version %}
5.5.0
{% endblock %}

{% block fetch %}
https://github.com/tesseract-ocr/tesseract/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:f2fb34ca035b6d087a42875a35a7a5c4155fa9979c6132365b1e5a28ebc3fc11
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
