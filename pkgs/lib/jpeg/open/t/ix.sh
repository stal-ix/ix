{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
openjpeg
{% endblock %}

{% block version %}
2.5.4
{% endblock %}

{% block fetch %}
https://github.com/uclouvain/openjpeg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a
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

{% block cpp_missing %}
{% if freebsd %}
netinet/in.h
{% endif %}
{% endblock %}
