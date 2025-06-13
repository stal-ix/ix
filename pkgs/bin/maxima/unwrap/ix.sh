{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
maxima
{% endblock %}

{% block version %}
5.47.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/maxima/Maxima-source/{{self.version().strip()}}-source/maxima-{{self.version().strip()}}.tar.gz
9104021b24fd53e8c03a983509cb42e937a925e8c0c85c335d7709a14fd40f7a
{% endblock %}

{% block bld_tool %}
bld/perl
bin/sbcl
bld/texinfo
{% endblock %}

{% block postinstall %}
:
{% endblock %}
