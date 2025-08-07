{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpg123
{% endblock %}

{% block version %}
1.33.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/{{self.version().strip()}}/mpg123-{{self.version().strip()}}.tar.bz2
1181f65eb3c8a0a8eed8b595a811988f53c82b0916b58d3c8cc9c3ced66f0312
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
