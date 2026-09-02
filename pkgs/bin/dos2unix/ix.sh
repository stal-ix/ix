{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dos2unix
{% endblock %}

{% block version %}
7.5.7
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/dos2unix/dos2unix-{{self.version().strip()}}.tar.gz
669ee27120ae71589f638fe3a167d6ea54f8633f5ab1b282551bd7a7c9510dfa
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/gettext
{% endblock %}
