{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_1_1_2.tar.gz
sha:2e71e6222af6043b95d6a4b737c23efa01e1750bd23db08c26abe0f2ba338403
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
