{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/psemiletov/tea-qt/archive/refs/tags/63.0.1.tar.gz
sha:aedb46f6f8a204b2358bda4544da4b6dc1854c88ed9240d26b23617df1aecf74
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
