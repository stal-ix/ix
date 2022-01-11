{% extends '//lib/webkit/mix.sh' %}

{% block bld_libs %}
{{super()}}
lib/glib/networking/register
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_MINIBROWSER=ON
{% endblock %}
