{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
maxima
{% endblock %}

{% block version %}
5.49.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/maxima/Maxima-source/{{self.version().strip()}}-source/maxima-{{self.version().strip()}}.tar.gz
6d401a4aa307cd3a5a9cadca4fa96c4ef0e24ff95a18bb6a8f803e3d2114adee
{% endblock %}

{% block bld_tool %}
bld/perl
bin/sbcl
bld/texinfo
{% endblock %}

{% block postinstall %}
:
{% endblock %}
