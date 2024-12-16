{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.5.0.tar.gz
sha:aa279f1b4bdcef7847b205f7b4b9e9312ada23f6cc09241aeaa30c43c7af4238
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
