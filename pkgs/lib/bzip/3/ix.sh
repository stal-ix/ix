{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.2.2.tar.gz
sha:e7792f3c83f1d9efd0d7b18da2eb6a1f119ffcdeb5515cf441145c2e9b72652e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
