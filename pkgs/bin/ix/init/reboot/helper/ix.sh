{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/tiny
{% endblock %}

{% block name %}
ix_reboot
{% endblock %}

{% block sources %}
main.c
{% endblock %}
