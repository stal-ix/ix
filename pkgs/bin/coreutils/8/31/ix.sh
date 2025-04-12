{% extends '//bin/coreutils/t/ix.sh' %}

{% block version %}
8.31
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.xz
sha:ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/obstack
{% endblock %}

{% block bld_tool %}
bld/perl
{% block yacc %}
bld/byacc
{% endblock %}
{{super()}}
{% endblock %}
