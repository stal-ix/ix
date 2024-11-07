{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_6_4.tar.gz
sha:372b18f6527d162fa9658f1c74d22a37429b82d822f5a1e1fc7e00f6045a06a2
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
