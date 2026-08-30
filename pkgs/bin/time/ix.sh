{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
time
{% endblock %}

{% block version %}
1.10
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/time/time-{{self.version().strip()}}.tar.gz
e8c29fb4ab599d8478e41e8618f50db8aede9c90af27d0d2ef28ae50d5de09c3
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
