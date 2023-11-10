{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.greenwoodsoftware.com/less/less-633.tar.gz
sha:2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
