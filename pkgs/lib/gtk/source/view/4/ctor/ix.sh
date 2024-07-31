{% extends '//die/c/registar.sh' %}

{% block lib_deps %}
lib/gtk/source/view/4
{% endblock %}

{% block constructors %}
gtksourceview_get_resource
{% endblock %}
