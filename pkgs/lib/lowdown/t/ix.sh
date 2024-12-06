{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_1_3_1.tar.gz
sha:028b77171cfa03d8360aaaaab81ef3ab1e99f9623cd39e62c5dae82ebad7c5db
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
