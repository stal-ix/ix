{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_1_1_1.tar.gz
sha:8224d936507664a57845c5eb6d8a97a32cb8f85ad60fb987bebf5f1fb1bb50bd
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
