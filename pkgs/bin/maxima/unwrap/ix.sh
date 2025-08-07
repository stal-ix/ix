{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
maxima
{% endblock %}

{% block version %}
5.48.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/maxima/Maxima-source/{{self.version().strip()}}-source/maxima-{{self.version().strip()}}.tar.gz
75af2bf1894df2a17aef8a5c378d72d4d53c669b9f47d60ec5ba8c8676c4aaab
{% endblock %}

{% block bld_tool %}
bld/perl
bin/sbcl
bld/texinfo
{% endblock %}

{% block postinstall %}
:
{% endblock %}
