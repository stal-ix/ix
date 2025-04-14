{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpg123
{% endblock %}

{% block version %}
1.32.10
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/{{self.version().strip()}}/mpg123-{{self.version().strip()}}.tar.bz2
sha:87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
