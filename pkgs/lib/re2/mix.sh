{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2022-04-01.tar.gz
sha:1ae8ccfdb1066a731bba6ee0881baad5efd2cd661acd9569b689f2586e1a50e9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
RE2_BUILD_TESTING=OFF
{% endblock %}
