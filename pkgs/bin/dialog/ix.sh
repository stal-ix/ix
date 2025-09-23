{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dialog
{% endblock %}

{% block version %}
1.3-20250817
{% endblock %}

{% block fetch %}
https://invisible-island.net/archives/dialog/dialog-{{self.version().strip()}}.tgz
6c59b4671616041dcd75d0d4a1d8646e8ca6b10a1ae534d3b9368c4c4ba29aa7
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
