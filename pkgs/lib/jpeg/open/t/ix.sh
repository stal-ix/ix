{% extends '//die/c/cmake.sh' %}

{% block version %}2.5.1{% endblock %}

{% block fetch %}
https://github.com/uclouvain/openjpeg/archive/refs/tags/v{{self.version()}}.tar.gz
sha:c0b92dadd65e33b1cf94f39dd9157d5469846744c2e0afb8ca10961f51f61da6
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
