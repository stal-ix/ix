{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20250414
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
sha:43258a0b819f3e362dd66c05b8212ea977606945f3887ba1b6ad612affabc9aa
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
