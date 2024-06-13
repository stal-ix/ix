{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/psemiletov/tea-qt/archive/refs/tags/63.0.2.tar.gz
sha:0726011d96ff1a09424d618d47a0d2110b229c3c8dd8a9e8b91a48a811ce2bb2
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/djvulibre
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
lib/poppler/next
{% endblock %}

{% block cmake_flags %}
USE_DJVU=ON
USE_PDF=ON
{% endblock %}
