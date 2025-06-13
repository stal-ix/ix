{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
less
{% endblock %}

{% block version %}
668
{% endblock %}

{% block fetch %}
https://www.greenwoodsoftware.com/less/less-{{self.version().strip()}}.tar.gz
2819f55564d86d542abbecafd82ff61e819a3eec967faa36cd3e68f1596a44b8
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
