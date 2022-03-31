{% extends '//lib/mupdf/t/mix.sh' %}

{% block make_flags %}
{{super()}}
HAVE_GLUT=no
{% endblock %}
