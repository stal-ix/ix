{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gtk/source/view/4
{% endblock %}

{% block export_libs %}
libgtksourceview-4.a
{% endblock %}

{% block export_lib %}
gtksourceview-4
{% endblock %}
