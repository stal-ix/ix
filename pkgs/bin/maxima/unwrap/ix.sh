{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
maxima
{% endblock %}

{% block version %}
5.50.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/maxima/Maxima-source/{{self.version().strip()}}-source/maxima-{{self.version().strip()}}.tar.gz
0bc4b5e11fe153ef20b24a3a816b668ece5378cc738fa24ca426b62fd6d8fc37
{% endblock %}

{% block bld_tool %}
bld/perl
bin/sbcl
bld/texinfo
{% endblock %}

{% block postinstall %}
:
{% endblock %}
