{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dos2unix
{% endblock %}

{% block version %}
7.5.4
{% endblock %}

{% block fetch %}
https://waterlan.home.xs4all.nl/dos2unix/dos2unix-{{self.version().strip()}}.tar.gz
f811a2b9e4a0c936c61ef7c1732993d1820e5cf011f4d93861885ccb8101ca21
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}
