{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpg123
{% endblock %}

{% block version %}
1.33.4
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/{{self.version().strip()}}/mpg123-{{self.version().strip()}}.tar.bz2
3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
