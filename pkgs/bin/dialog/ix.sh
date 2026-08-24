{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dialog
{% endblock %}

{% block version %}
1.3_20260721
{% endblock %}

{% block fetch %}
https://invisible-island.net/archives/dialog/dialog-{{self.version().strip()[:3]}}-{{self.version().strip()[4:]}}.tgz
62bdf59057d4f760a1cc2217827f07887b4a3eebf694c25eacd4803d2171cdc6
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
