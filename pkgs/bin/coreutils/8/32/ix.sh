{% extends '//bin/coreutils/8/31/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
8.32
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.xz
sha:4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa
{% endblock %}

{% block build_flags %}
{{super()}}
verbose
{% endblock %}

{% block yacc %}
bld/m4
bin/bison/3/6
{% endblock %}
