{% extends '//lib/mu/pdf/t/mix.sh' %}

{% block make_flags %}
{{super()}}
HAVE_GLUT=no
{% endblock %}
