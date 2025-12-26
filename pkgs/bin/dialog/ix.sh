{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dialog
{% endblock %}

{% block version %}
1.3.20251223
{% endblock %}

{% block fetch %}
https://invisible-island.net/archives/dialog/dialog-{{self.version().strip()[:3]}}-{{self.version().strip()[4:]}}.tgz
ada64c1593f995762354dda94e43a18b1fbe92fcd6bc8abddb47d4da46638fd1
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
