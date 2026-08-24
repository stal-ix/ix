{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dos2unix
{% endblock %}

{% block version %}
7.5.6
{% endblock %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-{{self.version().strip()}}.tar.gz
b900ed9a92ef9b2548a6ac708ec81f724c59f2c089ed90f8e39a4e1287b28c1f
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}
