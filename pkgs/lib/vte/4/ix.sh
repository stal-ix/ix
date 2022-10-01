{% extends '//lib/vte/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
{{super()}}
gtk3=false
gtk4=true
{% endblock %}
