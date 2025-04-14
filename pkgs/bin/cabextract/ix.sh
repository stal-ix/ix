{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
cabextract
{% endblock %}

{% block version %}
1.11
{% endblock %}

{% block fetch %}
https://www.cabextract.org.uk/cabextract-{{self.version().strip()}}.tar.gz
sha:b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd4657cd089b823a3ac6
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
