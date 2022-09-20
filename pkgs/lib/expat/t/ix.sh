{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_4_9.tar.gz
sha:286bb78d8800f20b5da0ff48d98d6c67a16242cfe8cc823a04998f94b5253279
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
