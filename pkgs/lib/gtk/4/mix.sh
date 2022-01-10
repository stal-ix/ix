{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/gtk/4/{{gtk4_ver or '6'}}
{% endblock %}
