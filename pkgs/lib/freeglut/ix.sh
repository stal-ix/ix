{% extends '//lib/freeglut/t/ix.sh' %}

{% block cmake_flags %}
FREEGLUT_BUILD_DEMOS=OFF
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib/pkgconfig
cp freeglut*.pc glut.pc
{% endblock %}
