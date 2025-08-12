{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
maxima
{% endblock %}

{% block version %}
5.48.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/maxima/Maxima-source/{{self.version().strip()}}-source/maxima-{{self.version().strip()}}.tar.gz
b0916b5fb37b6eeaae400083175e68e28f80b9a1ab580c106a05448cf1c496b2
{% endblock %}

{% block bld_tool %}
bld/perl
bin/sbcl
bld/texinfo
{% endblock %}

{% block postinstall %}
:
{% endblock %}
