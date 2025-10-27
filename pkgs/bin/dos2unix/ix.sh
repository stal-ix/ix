{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dos2unix
{% endblock %}

{% block version %}
7.5.3
{% endblock %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-{{self.version().strip()}}.tar.gz
28a4b0d9f9179da4e44c567b9c01f818b070a20827115fffd96f760dcfa0f3b2
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}
