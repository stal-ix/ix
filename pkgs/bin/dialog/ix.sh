{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dialog
{% endblock %}

{% block version %}
1.3.20260107
{% endblock %}

{% block fetch %}
https://invisible-island.net/archives/dialog/dialog-{{self.version().strip()[:3]}}-{{self.version().strip()[4:]}}.tgz
78b3dd18d95e50f0be8f9b9c1e7cffe28c9bf1cdf20d5b3ef17279c4da35c5b5
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
