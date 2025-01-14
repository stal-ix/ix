{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.24.7.tar.gz
sha:7cbc13c974d6abe978cafc9da12d1e79e07e365c42af75e43ec1b5cdc03ed447
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
