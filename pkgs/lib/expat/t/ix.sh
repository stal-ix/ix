{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_6_1.tar.gz
sha:14113ed69357172a0bf5a268793c8b5b01afc77c7a2e5fb8dd0b06cb87c02c4a
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
