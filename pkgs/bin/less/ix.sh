{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
less
{% endblock %}

{% block version %}
704
{% endblock %}

{% block fetch %}
https://www.greenwoodsoftware.com/less/less-{{self.version().strip()}}.tar.gz
20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
