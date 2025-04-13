{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cJSON
{% endblock %}

{% block version %}
1.7.18
{% endblock %}

{% block fetch %}
https://github.com/DaveGamble/cJSON/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3aa806844a03442c00769b83e99970be70fbef03735ff898f4811dd03b9f5ee5
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
