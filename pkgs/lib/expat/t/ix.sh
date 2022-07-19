{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_4_8.tar.gz
sha:122d8ae7a0170b9835cb45b216d856c1f83dd83792f8f0f80c31e98283efbe87
{% endblock %}

{% block lib_deps %}
lib/c
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

{% block setup_tools %}
>install_name_tool
chmod +x install_name_tool
{% endblock %}
