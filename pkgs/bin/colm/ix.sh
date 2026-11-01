{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
colm
{% endblock %}

{% block version %}
0.14.7
{% endblock %}

{% block fetch %}
https://www.colm.net/files/colm/colm-{{self.version().strip()}}.tar.gz
6037b31c358dda6f580f7321f97a182144a8401c690b458fcae055c65501977d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/tar
{% endblock %}

{% block patch %}
sed -i 's/^SUBDIRS = src doc test$/SUBDIRS = src/' Makefile.am
{% endblock %}

{% block postinstall %}
: keep the compiler, headers, and static libraries needed by ragel
{% endblock %}

{% block env %}
export COFLAGS="--with-colm=${out} ${COFLAGS}"
{% endblock %}
