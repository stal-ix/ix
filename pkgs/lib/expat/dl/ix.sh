{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/expat
{% endblock %}

{% block export_libs %}
libexpat.a
{% endblock %}

{% block export_lib %}
expat
{% endblock %}
