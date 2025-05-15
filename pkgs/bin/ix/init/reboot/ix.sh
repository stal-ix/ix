{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block name %}
reboot
{% endblock %}

{% block sources %}
main.c
{% endblock %}
