{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
a52dec
{% endblock %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://git.adelielinux.org/community/a52dec/-/archive/v{{self.version().strip()}}/a52dec-v{{self.version().strip()}}.tar.bz2
d4f26685d32a8c85f86a5cb800554160fb85400298a0a27151c3d1e63a170943
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
