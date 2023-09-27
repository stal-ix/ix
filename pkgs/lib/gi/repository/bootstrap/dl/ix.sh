{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gi/repository/bootstrap
{% endblock %}

{% block export_libs %}
libgirepository-1.0.a
{% endblock %}

{% block export_lib %}
girepository-1.0
{% endblock %}
