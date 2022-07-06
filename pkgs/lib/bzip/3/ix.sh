{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.1.4.tar.gz
sha:73d5462f253a5a8dcc201f05602c0ea6284d99d7285665ae0bd0d41d14f927b4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
