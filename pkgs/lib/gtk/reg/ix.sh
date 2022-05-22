{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block export_symbols %}
gtk_misc_get_type
gtk_revealer_get_type
{% endblock %}

{% block export_lib %}
gtk
{% endblock %}
