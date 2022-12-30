{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/mpfr
{% endblock %}

{% block export_libs %}
libmpfr.a
{% endblock %}

{% block export_lib %}
mpfr
{% endblock %}
