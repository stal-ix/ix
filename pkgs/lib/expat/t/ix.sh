{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libexpat
{% endblock %}

{% block version %}
2.10.0
{% endblock %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_{{self.version().strip().replace('.', '_')}}.tar.gz
b3644a12f62d7762b62c444f69d169ba0234f13138d0240244bca64cbe35286f
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
