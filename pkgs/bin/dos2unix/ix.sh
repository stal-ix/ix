{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dos2unix
{% endblock %}

{% block version %}
7.5.6
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/dos2unix/dos2unix-{{self.version().strip()}}.tar.gz
63650acbd0c7fa8623429bcbf93a888e3351a1cad0f556cf41876f5673dd7d0b
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}
