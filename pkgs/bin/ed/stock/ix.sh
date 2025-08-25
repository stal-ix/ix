{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ed
{% endblock %}

{% block version %}
1.22.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-{{self.version().strip()}}.tar.lz
f58d15242056e15af76f13f34c60d890fa2a2d5cb0abef91c115e4d83794ffe3
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
