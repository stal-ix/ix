{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/psemiletov/tea-qt/archive/refs/tags/61.2.0.tar.gz
sha:d93f93934d4f97cbd19e5312374168e4b673e11d753d58a5fcfa510ee863d2f6
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
