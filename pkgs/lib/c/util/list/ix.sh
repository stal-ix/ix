{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/c-util/c-list/archive/refs/tags/v3.1.0.tar.gz
sha:7d5b12166859bd729404cba8da575ae47952cbb97d650c5bbe50559c03631e4b
{% endblock %}

{% block lib_deps %}
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

