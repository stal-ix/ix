{% extends '//lib/mu/pdf/t/ix.sh' %}

{% block bld_libs %}
lib/glu
lib/freeglut
lib/drivers/3d
lib/shim/fake(lib_name=GL)
lib/shim/fake(lib_name=glut)
{{super()}}
{% endblock %}
