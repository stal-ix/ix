{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/pipeseroni/pipes.c
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_commit %}
e74a9f345b65847eaa87f243c6e1ab70fe51be54
{% endblock %}

{% block git_sha %}
eae838f0873aaec3ed521a9757b3207f259841baa17c7cee00fcc5a60f9dcb40
{% endblock %}

{% block pkg_name %}
pipes.c
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block patch %}
head -4 configure.ac > configure.ac.new
echo 'AC_INIT([pipes.c], [1.2.1], [stefans.mezulis@gmail.com])' >> configure.ac.new
tail -n +9 configure.ac >> configure.ac.new
mv configure.ac.new configure.ac
{% endblock %}

{% block bld_tool %}
bld/auto/archive
{% endblock %}

{% block bld_libs %}
lib/c
lib/ncurses
{% endblock %}
