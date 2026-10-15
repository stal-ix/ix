{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libexpat
{% endblock %}

{% block version %}
2.8.5
{% endblock %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_{{self.version().strip().replace('.', '_')}}.tar.gz
fd022c541a189bd5bee042a22188351b31e39b9389c2525fa98c28bd05c9ef21
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
