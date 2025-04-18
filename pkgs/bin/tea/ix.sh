{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tea-qt
{% endblock %}

{% block version %}
63.3.1
{% endblock %}

{% block fetch %}
https://github.com/psemiletov/tea-qt/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:105a4d02164279d61f868d8e07b382f598fa34918a588b35010dcdd1fa27e540
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/poppler
lib/djvulibre
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
{% endblock %}

{% block cmake_flags %}
USE_DJVU=ON
USE_PDF=ON
{% endblock %}
