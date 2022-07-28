{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/md
{% endblock %}

{% block sources %}
lin.c
{% endblock %}

{% block name %}
liner
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old bin/bin_ix
{% endblock %}
