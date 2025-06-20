{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block name %}
{{prog_name}}
{% endblock %}

{% block cpp_defines %}
IX_ACTION={{prog_action}}
{% endblock %}

{% block sources %}
main.c
{% endblock %}
