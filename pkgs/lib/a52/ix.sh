{% extends '//die/autohell.sh' %}

{% block fetch %}
https://liba52.sourceforge.io/files/a52dec-0.7.4.tar.gz
sha:a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
