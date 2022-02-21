{% extends '//lib/gcr/t/mix.sh' %}

{% block bld_libs %}
lib/gtk/3
{{super()}}
{% endblock %}

{% block meson_flags %}
gtk=true
{{super()}}
{% endblock %}
