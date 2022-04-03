{% extends '//mix/make.sh' %}

{% block fetch %}
https://mujs.com/downloads/mujs-1.2.0.tar.xz
sha:66976d1e06a352754a2342af73d1aecbb53cc7cdae2b68cda013b7ddcf923233
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
HAVE_READLINE=no
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
