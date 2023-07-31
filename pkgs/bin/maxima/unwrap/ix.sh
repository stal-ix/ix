{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/maxima/Maxima-source/5.47.0-source/maxima-5.47.0.tar.gz
sha:9104021b24fd53e8c03a983509cb42e937a925e8c0c85c335d7709a14fd40f7a
{% endblock %}

{% block bld_tool %}
bld/perl
bin/sbcl
bld/texinfo
{% endblock %}

{% block postinstall %}
:
{% endblock %}
