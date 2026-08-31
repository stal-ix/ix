{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ragel
{% endblock %}

{% block version %}
6.11
{% endblock %}

{% block fetch %}
http://www.colm.net/files/ragel/ragel-{{self.version().strip()}}.tar.gz
47653e376554adbb617d2f1da15394b6a163264e2410c2bff3581347a14890e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
