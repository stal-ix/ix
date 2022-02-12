{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/gtk/{{gtk_ver or '4/6'}}
{% endblock %}
