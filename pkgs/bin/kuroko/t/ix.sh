{% extends '//die/c/make.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
KRK_DISABLE_THREADS=1
{% endblock %}
