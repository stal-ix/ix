{% extends '//die/make.sh' %}

{% block fetch %}
#http://mama.indstate.edu/users/ice/tree/src/tree-2.0.2.tgz
ftp://mama.indstate.edu/linux/tree/tree-2.0.2.tgz
sha:7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
