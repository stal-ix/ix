{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
openjpeg
{% endblock %}

{% block version %}
2.5.3
{% endblock %}

{% block fetch %}
https://github.com/uclouvain/openjpeg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
368fe0468228e767433c9ebdea82ad9d801a3ad1e4234421f352c8b06e7aa707
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=javac)
{% endblock %}

{% block cmake_flags %}
{% if mingw32 %}
BUILD_JPIP=OFF
{% else %}
BUILD_JPIP=ON
{% endif %}
BUILD_JAVA=OFF
{% endblock %}
