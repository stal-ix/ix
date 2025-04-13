{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tesseract
{% endblock %}

{% block version %}
5.2.0
{% endblock %}

{% block fetch %}
https://github.com/tesseract-ocr/tesseract/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:eba4deb2f92a3f89a6623812074af8c53b772079525b3c263aa70bbf7b748b3c
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
