{% extends '//lib/freeglut/t/ix.sh' %}

{% block bld_libs %}
lib/c++
lib/glu
lib/drivers/3d
lib/build/muldefs
{{super()}}
{% endblock %}

{% block cmake_flags %}
FREEGLUT_BUILD_DEMOS=ON
{{super()}}
{% endblock %}

{% block cpp_missing %}
{{super()}}
GL/glu.h
{% endblock %}
