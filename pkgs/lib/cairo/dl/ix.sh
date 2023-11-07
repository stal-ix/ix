{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/cairo
{% endblock %}

{% block export_libs %}
libcairo.a
{% endblock %}

{% block export_lib %}
cairo
{% endblock %}
