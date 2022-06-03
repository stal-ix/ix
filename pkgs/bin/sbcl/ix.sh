{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.5/sbcl-2.2.5-source.tar.bz2
sha:8584b541370fd6ad6e58d3f97982077dfcab240f30d4e9b18f15da91c2f13ed1
{% endblock %}

{% block bld_tool %}
bld/sbcl
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}

{% block extern_symbols %}
{{super()}}
{% include 'sbcl' %}
malloc
free
_exit
clock_gettime
pthread_create
pthread_join
{% endblock %}
