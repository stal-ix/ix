{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20250707
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
a61240a4065d90c3925dd774f8fa3d73deec1a73228a86ee95fcd82063d28b08
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
