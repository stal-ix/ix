{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpg123
{% endblock %}

{% block version %}
1.33.3
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/{{self.version().strip()}}/mpg123-{{self.version().strip()}}.tar.bz2
6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
