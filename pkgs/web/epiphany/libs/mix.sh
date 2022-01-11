{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/c
lib/gtk
lib/glib
lib/webkit
{% endblock %}

{% block run_data %}
misc/gsettings-desktop-schemas
{% endblock %}
