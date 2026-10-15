{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xCHM
{% endblock %}

{% block version %}
1.40
{% endblock %}

{% block fetch %}
https://github.com/rzvncj/xCHM/archive/refs/tags/{{self.version().strip()}}.tar.gz
b07e6459c90af4067d0c128cc86e8905c976b200e32cdb7cea64134609885ac3
{% endblock %}

{%block bld_libs %}
lib/c
lib/chm
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
