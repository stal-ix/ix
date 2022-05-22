{% extends '//lib/mu/pdf/t/ix.sh' %}

{% block make_flags %}
{{super()}}
HAVE_GLUT=no
{% endblock %}
