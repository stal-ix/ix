{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libexpat
{% endblock %}

{% block version %}
2.8.4
{% endblock %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_{{self.version().strip().replace('.', '_')}}.tar.gz
a8a9c5cbba9110000b13cc9943f50fcd7e552a5cbad49cb191142c500a0a11b7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=install_name_tool)
{% endblock %}

{% block unpack %}
{{super()}}
cd expat
{% endblock %}

{% block cmake_flags %}
EXPAT_BUILD_TESTS=OFF
EXPAT_BUILD_EXAMPLES=OFF
EXPAT_SHARED_LIBS=OFF
{% if linux %}
EXPAT_WITH_GETRANDOM=ON
{% endif %}
{% endblock %}
