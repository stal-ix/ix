{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_7_0.tar.gz
sha:d5ff350414fec2a0c35855e29a08297cbb3d9ce6b3eff773b08f537dbc352b3d
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
