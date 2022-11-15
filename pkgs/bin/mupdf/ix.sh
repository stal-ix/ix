{% extends '//lib/mu/pdf/t/ix.sh' %}

{% block bld_libs %}
lib/glu
lib/freeglut
lib/drivers/3d
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|-lglut||' -e 's|-lGL||' -i Makerules
{{super()}}
{% endblock %}
