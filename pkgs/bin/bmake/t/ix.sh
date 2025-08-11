{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20250804
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
0b49037644b253206d2e710d46e32859e62dfe2c6c8e7218ae439f2ef50de8ad
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
