{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tesseract
{% endblock %}

{% block version %}
5.5.4
{% endblock %}

{% block fetch %}
https://github.com/tesseract-ocr/tesseract/archive/refs/tags/{{self.version().strip()}}.tar.gz
a8dbf8b8c8ee427ff6ad1d99116502feaf59440af1adb893caf60a6576826cf4
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
