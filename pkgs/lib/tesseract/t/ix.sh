{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tesseract
{% endblock %}

{% block version %}
5.5.1
{% endblock %}

{% block fetch %}
https://github.com/tesseract-ocr/tesseract/archive/refs/tags/{{self.version().strip()}}.tar.gz
a7a3f2a7420cb6a6a94d80c24163e183cf1d2f1bed2df3bbc397c81808a57237
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
