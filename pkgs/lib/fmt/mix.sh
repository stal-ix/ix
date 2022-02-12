{% extends '//mix/cmake.sh' %}

{% block fetch %}
#https://github.com/fmtlib/fmt/archive/refs/tags/8.1.1.tar.gz
#sha:3d794d3cf67633b34b2771eb9f073bde87e846e0d395d254df7b211ef1ec7346
https://github.com/fmtlib/fmt/archive/refs/tags/7.1.3.tar.gz
2522ec65070c0bda0ca288677ded2831
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
FMT_TEST=OFF
FMT_FUZZ=OFF
{% endblock %}
