{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/gtk/source/view/{{1 + gtk_ver | int}}
{% endblock %}
