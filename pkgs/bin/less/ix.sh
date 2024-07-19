{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.greenwoodsoftware.com/less/less-661.tar.gz
sha:2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
