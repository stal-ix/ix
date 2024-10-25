{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_1_2_0.tar.gz
sha:a4a7eab951b85a8b25c806a4e399ef3e06458a3f6811ac1201a5fb765ccde3d2
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
