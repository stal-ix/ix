{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gtk/4
{% endblock %}

{% block export_libs %}
libgtk-4.a
{% endblock %}

{% block export_lib %}
gtk-4
{% endblock %}
