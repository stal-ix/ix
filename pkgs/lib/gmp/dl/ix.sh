{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gmp
{% endblock %}

{% block export_libs %}
libgmp.a
{% endblock %}

{% block export_lib %}
gmp
{% endblock %}
