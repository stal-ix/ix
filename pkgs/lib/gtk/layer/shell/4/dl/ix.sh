{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gtk/layer/shell/4
{% endblock %}

{% block export_libs %}
libgtk4-layer-shell.a
{% endblock %}

{% block export_lib %}
gtk4-layer-shell
{% endblock %}
