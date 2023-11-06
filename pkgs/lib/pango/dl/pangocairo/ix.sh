{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/pango
{% endblock %}

{% block export_libs %}
libpangocairo-1.0.a
{% endblock %}

{% block export_lib %}
pangocairo-1
{% endblock %}
