{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/gtk/4/dl
lib/gtk/4/reg
lib/gtk/4/stock
{% endblock %}

{% block run_data %}
etc/concat
lib/gtk/4/env
{% endblock %}
