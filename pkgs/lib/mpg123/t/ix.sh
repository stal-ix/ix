{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpg123
{% endblock %}

{% block version %}
1.33.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/{{self.version().strip()}}/mpg123-{{self.version().strip()}}.tar.bz2
2c54fabbfa696dce8f9b137c8ef7a429a061f8fe633cd7d0a511809855f2c219
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}
