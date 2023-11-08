{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_1_1_0.tar.gz
sha:5cc997f742fd9e3268a2bf15cb9c58bfa173b303bc13f5c61f67dedfff3bccce
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure PREFIX=${out}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
