{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dialog
{% endblock %}

{% block version %}
1.3.20251001
{% endblock %}

{% block fetch %}
https://invisible-island.net/archives/dialog/dialog-{{self.version().strip()[:3]}}-{{self.version().strip()[4:]}}.tgz
bee47347a983312facc4dbcccd7fcc86608d684e1f119d9049c4692213db96c3
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
