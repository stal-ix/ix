{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/psemiletov/tea-qt/archive/refs/tags/62.0.2.tar.gz
sha:974e3843e27e692eab594d3f481bc877d411812f1249377b618dd6e64486a0db
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
