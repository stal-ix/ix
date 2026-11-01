{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gtk/source/view/5
{% endblock %}

{% block export_libs %}
libgtksourceview-5.a
{% endblock %}

{% block export_lib %}
gtksourceview-5
{% endblock %}
