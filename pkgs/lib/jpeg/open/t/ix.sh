{% extends '//die/c/cmake.sh' %}

{% block version %}2.5{% endblock %}

{% block fetch %}
https://github.com/uclouvain/openjpeg/archive/refs/tags/v{{self.version()}}.0.tar.gz
sha:0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a
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
