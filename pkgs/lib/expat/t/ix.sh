{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libexpat
{% endblock %}

{% block version %}
2.7.3
{% endblock %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_{{self.version().strip().replace('.', '_')}}.tar.gz
7c853a76f7c2a562c3edfd84ca47e487d9eff3966786191dfb60cc441daf82d6
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
