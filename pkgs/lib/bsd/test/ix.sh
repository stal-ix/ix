{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/bsd/init
{% endblock %}

{% block name %}
test_init
{% endblock %}

{% block sources %}
main.c
{% endblock %}

{% block install1 %}
mkdir ${out}/bin
cp test_init ${out}/bin/
{% endblock %}
