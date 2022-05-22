{% extends '//lib/freeglut/t/ix.sh' %}

{% block bld_libs %}
lib/c++
lib/drivers/3d
{{super()}}
{% endblock %}

{% block cmake_flags %}
FREEGLUT_BUILD_DEMOS=ON
{{super()}}
{% endblock %}
