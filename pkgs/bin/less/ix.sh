{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
less
{% endblock %}

{% block version %}
710
{% endblock %}

{% block fetch %}
https://www.greenwoodsoftware.com/less/less-{{self.version().strip()}}.tar.gz
d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
