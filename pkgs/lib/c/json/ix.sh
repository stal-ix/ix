{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cJSON
{% endblock %}

{% block version %}
1.7.19
{% endblock %}

{% block fetch %}
https://github.com/DaveGamble/cJSON/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7fa616e3046edfa7a28a32d5f9eacfd23f92900fe1f8ccd988c1662f30454562
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CJSON_BUILD_SHARED_LIBS=OFF
ENABLE_CJSON_TEST=OFF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
