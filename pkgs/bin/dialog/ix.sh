{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dialog
{% endblock %}

{% block version %}
1.3-20250116
{% endblock %}

{% block fetch %}
https://invisible-island.net/archives/dialog/dialog-{{self.version().strip()}}.tgz
sha:68406329827b783d0a8959cc20a94c6e1791ac861a27f854e06e9020541816dd
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
